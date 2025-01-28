class ContentManager {

  final String Function(String,String) ImageRequestManager;
  final String Function(String,String) AnchorRequestManager;

  ContentManager({required this.ImageRequestManager , required this.AnchorRequestManager});

}