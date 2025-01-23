
import 'structuredcontent.dart';
import 'dart:html';
import 'structuredcontentmanager.dart';


class Structuredcontentgenerator {

  final HtmlDocument document;
  final Structuredcontentmanager manager;

  Structuredcontentgenerator({required this.document, required this.manager});

  void appendStructuredContent(HtmlElement node, dynamic content,String dictionary){
    node.classes.add('structured-content');
    this._appendStructuredContent(node, content.Content, dictionary, null);

  }

  Element createStructuredContent(dynamic content, String dictionary){
    final node = this._createElement('span', 'structured-content');
    this._appendStructuredContent(node, content, dictionary, null);
    return node;

  }


  AnchorElement createDefinitionImage(ImageData data, String? dictionary){
    //Returns an HTML anchor element


    final hasPrefferedWidth = (data.preferredWidth != null);
    final hasPrefferedHeight = (data.preferredHeight != null);
    final invAspectRatio = (hasPrefferedHeight && hasPrefferedHeight) ? (data.preferredWidth!.toDouble() / data.preferredHeight!.toDouble()) : (data.height!/data.width!);
    
    final usedWidth = (hasPrefferedWidth ? data.preferredWidth : (hasPrefferedHeight ? data.preferredHeight! / invAspectRatio : data.width));

    final AnchorElement node =  AnchorElement();
    node.classes.add('gloss-image-link');
    node.target = '_blank';
    node.rel = 'noreferrer noopener';


    final imageContainer = this._createElement('span', 'gloss-image-container');
    node.children.add(imageContainer);

    final aspectRatioSizer = this._createElement('span', 'gloss-image-sizer');
    imageContainer.children.add(aspectRatioSizer);

    final imageBackground = this._createElement('span', 'gloss-image-background');
    imageContainer.children.add(imageBackground);

    final overlay = this._createElement('span', 'gloss-image-container-overlay');
    imageContainer.children.add(overlay);

    final linkText = this._createElement('span', 'gloss-image-link-text');
    node.children.add(linkText);

    if(this.manager.type == 'webview'){
      node.addEventListener(
        'click',
        (Event e) {
          if(window.name == 'webview'){
            window.postMessage({'message' : 'onNodeClickRequest', 'data': data}, '*');
            
          }

        }
        );

    }

    node.dataset['path'] = data.path!;
    node.dataset['dictionary'] = dictionary ?? '';
    node.dataset['imageLoadState'] = 'not-loaded';
    node.dataset['hasAspectRatio'] = 'true';
    node.dataset['imageRendering'] = ((data.imageRendering is String) ? data.imageRendering : (data.pixelated ? 'pixelated' : 'auto'))!;
    node.dataset['appearance'] = ((data.appearance is String) ? data.appearance : 'auto')!;
    node.dataset['background'] = (data.background is bool) ? '${data.background}' : 'true';
    node.dataset['collapsed'] = (data.collapsed is bool) ? '${data.collapsed}' : 'false';
    node.dataset['collapsible'] = (data.collapsible is bool) ? '${data.collapsible}' : 'true';

    if(data.verticalAlign is String){
      node.dataset['verticalAlign'] = data.verticalAlign!;
    }

    if(data.sizeUnits is String && (hasPrefferedHeight || hasPrefferedHeight)){
      node.dataset['sizeUnits'] = data.sizeUnits!;
    }

    aspectRatioSizer.style.paddingTop = '${invAspectRatio * 100}%';

    if(data.border is String) imageContainer.style.border = data.border!;
    if(data.borderRadius is String) imageContainer.style.borderRadius = data.borderRadius!;

    imageContainer.style.width = '${usedWidth}em';

    if(data.title is String){
      imageContainer.title = data.title!;
    }

    CanvasElement glossImageCanvas = CanvasElement();
    glossImageCanvas.classes.add("gloss-image");
    ImageElement glossImageImage = ImageElement();
    glossImageImage.classes.add("gloss-image");

    

    if(this.manager != null){

      final image = (this.manager.type == 'webview') ? glossImageCanvas : glossImageImage;

      if(data.sizeUnits == 'em' && (hasPrefferedHeight | hasPrefferedHeight)){
        final emSize = 14;
        final scaleFactor = 2 * window.devicePixelRatio;
        image.style.width = '${usedWidth}em';
        image.style.height = '${usedWidth! * invAspectRatio}em';
        image.width = usedWidth * emSize * scaleFactor;


      } else{

        image.width = usedWidth!;

      }

      image.height = image.clientWidth * invAspectRatio;

      image.style.width = '100%';
      image.style.height = '100%';

      imageContainer.children.add(image);

    }

    return node;






  }

  void _appendStructuredContent(Element container, dynamic content, String dictionary, String? language){
    if(content is String){
      if(content.length > 0){
        container.append(this.createTextNode(content));
        if(language == null){
          final language2 = 'ja';
          if(language2 != null){
            container.lang = language2;
          }

        }

      }
      return;

    }
    if(!(content is Object && content != null)){
      return;

    }
    if(content is List){
      for(final item in content){
        this._appendStructuredContent(container, item, dictionary, language);
      }
      return;
    }
    final node = this._createStructuredContentGenericElement(content, dictionary, language);
    if(node != null){
      container.append(node);
    }


  }

  Element _createElement(String tagName, String className){
    final node = this.document.createElement(tagName);
    node.classes = [className];
    return node;

  }

  Node createTextNode(String data){
    return this.document.append(createTextNode(data));

  }

  void _setElementDataset(Element element, Map<String, dynamic> data){

    data.forEach((key,value){
      if(key.length > 0){
        key = '${key[0].toUpperCase()}${key.substring(1)}';

      }
      key = 'sc${key}';
      try{
        element.dataset[key] = value;
      }catch(e){}

    });
  }




  void _setImageData(AnchorElement node, ImageElement image, Element imageBackground, String? url, bool unloaded){

    if(url != null){
      image.src = url;
      node.href = url;
      node.dataset['image-load-state'] = 'loaded';
      imageBackground.style.setProperty('--image', 'url("${url})');


    } else {
      image.removeAttribute('src');
      node.removeAttribute('href');
      node.dataset['image-load-state'] = unloaded ? 'unloaded' : 'load-error';
      imageBackground.style.removeProperty('--image');
    }

  }

  Element? _createStructuredContentGenericElement(dynamic content, String dictionary, String? language){
    final tag = content["tag"];
    switch(tag){
      case 'br':
        return this._createStructuredContentElement(tag, content, dictionary, language, 'simple', false, false);
      case 'ruby':
      case 'rt':
      case 'rp':
        return this._createStructuredContentElement(tag, content, dictionary, language, 'simple', true, false);
      case 'table':
        return this._createStructuredContentTableElement(tag, content, dictionary, language);
      case 'thead':
      case 'tbody':
      case 'tfoot':
      case 'tr':
        return this._createStructuredContentElement(tag, content, dictionary, language, 'table', true, false);
      case 'th':
      case 'td':
        return this._createStructuredContentElement(tag, content, dictionary, language, 'table-cell', true, true);
      case 'div':
      case 'span':
      case 'ol':
      case 'ul':
      case 'li':
      case 'details':
      case 'summary':
        return this._createStructuredContentElement(tag, content, dictionary, language, 'simple', true, true);
      case 'img':
        return this.createDefinitionImage(content, dictionary);
      case 'a':
        return this._createLinkElement(content, dictionary, language);

    }
    return null;

  }

  Element _createStructuredContentTableElement(String tag, StructuredContentContent content, String dictionary, String? language){
    
    final container = this._createElement('div', 'gloss-sc-table-container');
    final table = this._createStructuredContentElement(tag, content, dictionary, language, 'table', true, false);
    container.children.add(table);
    return container;
     
  }

  Element _createStructuredContentElement(String tag , StructuredContentContent content, String dictionary, String? language, String type, bool hasChildren, bool hasStyle){
    final node = this._createElement(tag, 'gloss-sc-${tag}');

    final data = content.data;
    final lang = content.lang;

    if(data is Object && data != null){

      this._setElementDataset(node, data);

    }

    if(data is String){
      node.lang = lang;
      language = lang;
    }

    switch(type){
      case 'table-cell':
        {
          final cell = node;
          final colSpan = content.colSpan;
          final rowSpan = content.rowSpan;
          if(colSpan is int){
            cell.attributes['colSpan'] = colSpan.toString();
            cell.attributes['rowSpan'] = rowSpan.toString();
          }


        }
        break;
    }
    if(hasStyle){
      final style = content.style;
      final title = content.title;
      final open = content.open;

      if(style is Object && style != null){
        this._setStructuredContentElementStyle(node, style);

      } 
      if(title is String) node.title = title;
      if(open is bool && open) node.setAttribute('open', '');
    }
    if(hasChildren){
      this._appendStructuredContent(node, content.content, dictionary, language)
    }


  }

  void _setStructuredContentElementStyle(Element node , StructuredContentStyle content){
    final style = node;
    fontStyle = content.fontStyle;
    fontWeight,
    fontSize,
    color,
    background,
    backgroundColor,
    textDecorationLine,
    textDecorationStyle,
    textDecorationColor,
    borderColor,
    borderStyle,
    borderRadius,
    borderWidth,
    clipPath,
    verticalAlign,
    textAlign,
    textEmphasis,
    textShadow,
    margin,
    marginTop,
    marginLeft,
    marginRight,
    marginBottom,
    padding,
    paddingTop,
    paddingLeft,
    paddingRight,
    paddingBottom,
    wordBreak,
    whiteSpace,
    cursor,
    listStyleType


  }

  AnchorElement _createLinkElement(dynamic content, String dictionary, String? language){

  }



}

extension on HtmlElement {
  set height(double height) {}

  set width(num width) {}
}