@JS()
library react_binding;

import 'dart:html' as html;
import 'package:js/js.dart';
import 'package:meta/meta.dart';

@JS('React.createElement')
external Element element(String tagName, Props props);

@JS('react_binding.define')
external Def define(library, classname);

@JS('React.createElement')
external Element component(Def def, Props props);

@JS('ReactDOM.render')
external void mount(node, html.Element element);

@JS('ReactDOM.unmountComponentAtNode')
external bool unmount(html.Element element);

@anonymous
class Element {}

@anonymous
class Def {}

@JS('react_binding.Component')
class ReactComponent {
  external get props;
  external set props(value);

  external get state;

  //FIXME Should only happen in the ctor. perhaps use a different api
  external set state(value);

  @virtual external void render();
}


//TODO consider using js_util to set values.
@anonymous
@JS()
class Props {
  external Props();

  external set href(String value);

  //TODO support multiple children that aren't strings.

  external set children(String value);

  external set onClick(handler);
}


typedef void EventHandler(event);


Element button({String text, EventHandler onClick}) {
  var props = new Props()
    ..children = text
    ..onClick = allowInterop(onClick); // Note: allowInterop seems to be a noop. It's not needed.
  return element('button', props);
}
