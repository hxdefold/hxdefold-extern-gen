package defold;

/**
    Functions to manipulate a label component.

    See `LabelProperties` for related properties.
**/
@:native("_G.label")
extern class Label {
    /**
        Set the text for a label.
        
        Sets the text of a label component
        
        @param url the label that should have a constant set (url)
        @param text the text (string|hash)
    **/
    static function set_text(url:Url, text:EitherType<Hash, String>):Void;
}

/**
    Properties related to the `Label` module.
**/
@:publicFields
class LabelProperties {
    /**
        Label color (vector4).
        
        The color of the label. The type of the property is vector4.
    **/
    static var color(default, never) = new Property<TODO>("color");

    /**
        Label outline (vector4).
        
        The outline color of the label. The type of the property is vector4.
    **/
    static var outline(default, never) = new Property<TODO>("outline");

    /**
        Label scale (vector3|number).
        
        The scale of the label. The type of the property is vector3.
    **/
    static var scale(default, never) = new Property<TODO>("scale");

    /**
        Label shadow (vector4).
        
        The shadow color of the label. The type of the property is vector4.
    **/
    static var shadow(default, never) = new Property<TODO>("shadow");

    /**
        Label size (vector3).
        
        Returns the size of the label. THe size will constrain the text if line break is enabled
        The type of the property is vector3.
    **/
    static var size(default, never) = new Property<TODO>("size");
}