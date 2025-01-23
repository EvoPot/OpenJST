
class Structuredcontent {

  dynamic Content;

  ImageData? imageElement;

  StructuredContentContent Data = StructuredContentContent();

  dynamic Element;

  dynamic styledElement;

  


}


class ImageData{
  final String? path;
  final int? width;
  final int? height;
  final int? preferredWidth;
  final int? preferredHeight;
  final String? title;
  final bool pixelated;
  final String? imageRendering;
  final String? appearance;
  final bool? background;
  final bool? collapsed;
  final bool? collapsible;
  final String? verticalAlign;
  final String? border;
  final String? borderRadius;
  final String? sizeUnits;




  ImageData({
    required this.path,
    this.width = 100,
    this.height = 100, 
    this.preferredWidth, 
    this.preferredHeight, 
    this.title, 
    required this.pixelated, 
    this.imageRendering, 
    this.appearance, 
    this.background, 
    this.collapsed, 
    this.collapsible, 
    this.verticalAlign, 
    this.border, 
    this.borderRadius, 
    this.sizeUnits});}



class StructuredContentContent{

  Map<String,dynamic>? data;
  String? lang;
  int? colSpan;
  int? rowSpan;
  StructuredContentStyle? style;
  String? title;
  bool? open;
  dynamic content;

}

class StructuredContentStyle{

}


