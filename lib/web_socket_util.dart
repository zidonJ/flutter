import 'dart:async';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const String socketUrl = 'ws://127.0.0.0:8181';

enum SocketStatus {
  connected,
  failed,
  closed,
}

class WebSocketUtility {
  static final WebSocketUtility _socket = WebSocketUtility._();
  WebSocketUtility._();
  // factory WebSocketUtility() => _socket;
  static WebSocketUtility get socket => _socket;
  // factory WebSocketUtility() => _getInstance()!;

  // static WebSocketUtility? get instance => _getInstance();
  // static WebSocketUtility? _instance;

  // WebSocketUtility._internal() {
  //   // 初始化
  //   print("可以做初始化操作");
  // }

  // static WebSocketUtility? _getInstance() {
  //   if (_instance == null) {
  //     _instance = WebSocketUtility._internal();
  //   }
  //   return _instance;
  // }

  // static WebSocketUtility get socket => _socket;

  IOWebSocketChannel? _webSocket; // WebSocket
  SocketStatus _socketStatus = SocketStatus.closed; // socket状态
  Timer? _heartBeat; // 心跳定时器
  var _heartTimes = 3000; // 心跳间隔(毫秒)
  var _reconnectCount = 60; // 重连次数，默认60次
  var _reconnectTimes = 0; // 重连计数器
  Timer? _reconnectTimer; // 重连定时器
  Function onError = () {}; // 连接错误回调
  Function onOpen = () {}; // 连接开启回调
  Function onMessage = (data) {}; // 接收消息回调

  /// 初始化WebSocket
  void connectWebSocket(Function onOpen, Function onMessage, Function onError) {
    this.onOpen = onOpen;
    this.onMessage = onMessage;
    this.onError = onError;
    openSocket();
  }

  /// 开启WebSocket连接
  void openSocket() {
    closeSocket();
    _webSocket = IOWebSocketChannel.connect(socketUrl);
    print('WebSocket连接成功: $socketUrl');
    // 连接成功，返回WebSocket实例
    _socketStatus = SocketStatus.connected;
    // 连接成功，重置重连计数器
    _reconnectTimes = 0;
    if (_reconnectTimer != null) {
      _reconnectTimer?.cancel();
      _reconnectTimer = null;
    }
    onOpen();
    // 接收消息
    _webSocket!.stream.listen((data) => webSocketOnMessage(data),
        onError: webSocketOnError, onDone: webSocketOnDone);
  }

  /// WebSocket接收消息回调
  webSocketOnMessage(data) {
    onMessage(data);
  }

  /// WebSocket关闭连接回调
  webSocketOnDone() {
    print('closed');
    reconnect();
  }

  /// WebSocket连接错误回调
  webSocketOnError(e) {
    WebSocketChannelException ex = e;
    _socketStatus = SocketStatus.failed;
    onError(ex.message);
    closeSocket();
  }

  /// 初始化心跳
  void initHeartBeat() {
    destroyHeartBeat();
    _heartBeat =
        Timer.periodic(Duration(milliseconds: _heartTimes.toInt()), (timer) {
      sentHeart();
    });
  }

  /// 心跳
  void sentHeart() {
    sendMessage('{"module": "HEART_CHECK", "message": "请求心跳"}');
  }

  /// 销毁心跳
  void destroyHeartBeat() {
    if (_heartBeat != null) {
      _heartBeat?.cancel();
      _heartBeat = null;
    }
  }

  /// 关闭WebSocket
  void closeSocket() {
    if (_webSocket != null) {
      print('WebSocket连接关闭');
      _webSocket!.sink.close();
      destroyHeartBeat();
      _socketStatus = SocketStatus.closed;
    }
  }

  /// 发送WebSocket消息
  void sendMessage(message) {
    if (_webSocket != null) {
      switch (_socketStatus) {
        case SocketStatus.connected:
          print('发送中：' + message);
          _webSocket!.sink.add(message);
          break;
        case SocketStatus.closed:
          print('连接已关闭');
          break;
        case SocketStatus.failed:
          print('发送失败');
          break;
        default:
          break;
      }
    }
  }

  /// 重连机制
  void reconnect() {
    if (_reconnectTimes < _reconnectCount) {
      _reconnectTimes++;
      _reconnectTimer =
          Timer.periodic(Duration(milliseconds: _heartTimes.toInt()), (timer) {
        openSocket();
      });
    } else {
      if (_reconnectTimer != null) {
        print('重连次数超过最大次数');
        _reconnectTimer?.cancel();
        _reconnectTimer = null;
      }
      return;
    }
  }
}
