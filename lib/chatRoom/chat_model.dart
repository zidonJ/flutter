class ChatModel {
  int? side;
  int? chatId;
  int? msgType; // 1 text 2 image 3 audio 4 video
  String? imageUrl;
  int? imageWidth;
  int? imageHeight;
  String text = "";
  String? videoUrl;
  String? audioUrl;
  int? audioTime;
  String? userId;

  ChatModel(
      {this.side,
      this.chatId,
      this.msgType,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      required this.text,
      this.videoUrl,
      this.audioUrl,
      this.audioTime,
      this.userId});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json["side"] is int) {
      side = json["side"];
    }
    if (json["chat_id"] is int) {
      chatId = json["chat_id"];
    }
    if (json["msg_type"] is int) {
      msgType = json["msg_type"];
    }
    if (json["image_url"] is String) {
      imageUrl = json["image_url"];
    }
    if (json["image_width"] is int) {
      imageWidth = json["image_width"];
    }
    if (json["image_height"] is int) {
      imageHeight = json["image_height"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["video_url"] is String) {
      videoUrl = json["video_url"];
    }
    if (json["audio_url"] is String) {
      audioUrl = json["audio_url"];
    }
    if (json["audio_time"] is int) {
      audioTime = json["audio_time"];
    }
    if (json["user_id"] is String) {
      userId = json["user_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["side"] = side;
    _data["chat_id"] = chatId;
    _data["msg_type"] = msgType;
    _data["image_url"] = imageUrl;
    _data["image_width"] = imageWidth;
    _data["image_height"] = imageHeight;
    _data["text"] = text;
    _data["video_url"] = videoUrl;
    _data["audio_url"] = audioUrl;
    _data["audio_time"] = audioTime;
    _data["user_id"] = userId;
    return _data;
  }
}
