'use strict';

var react_binding = {};

// Returns a reference to the JS class (i.e. the constructor) which backs a Dart class so that the
// reference can be passed to React.createElement() to create a component.
react_binding.define = function define(library, classname) {
    var lib = dart_library.import(library);
    var ctor = lib[library][classname];
    return ctor;
};


// Base class which ensures that the Dart component class' constructor is called.
react_binding.Component = class Component extends React.Component {
    constructor(props) {
        super(props);
        this.new(props);
    }
    new(props) {}
};
