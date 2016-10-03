library hello_world;

import 'dart:html' as html;
import 'react_binding.dart';


main() {
  var el = component(exampleComponent, null);
  mount(el, html.querySelector('#app'));
}


final Def exampleComponent = define('hello_world', 'ExampleComponent');


class ExampleComponent extends ReactComponent {
  ExampleComponent(props) {
    print('ExampleComponent ctor');
  }

  final foo = 'bar';

  Element render() => button(onClick: (e) { print(foo);}, text: 'oi you!');
}

