package defold;

/**
    <p>Functions to manipulate a label component.</p>

    See `LabelProperties` for related properties.
**/
@:native("_G.label")
extern class Label {
    /**
        Set the text for a label.
        
        Sets the text of a label component
        
        @param url 
        <span class="type">string | hash | url</span> the label that should have a constant set
        
        @param text 
        <span class="type">string</span> the text
    **/
    static function set_text(url:EitherType<Url, EitherType<Hash, String>>, text:String):Void;
}

/**
    Properties related to the `Label` module.
**/
@:publicFields
class LabelProperties {
    /**
        <span class="type">vector4</span> label color.
        
        The color of the label. The type of the property is vector4.
    **/
    static var color(default, never) = new Property<TODO>("color");

    /**
        <span class="type">vector4</span> label outline.
        
        The outline color of the label. The type of the property is vector4.
    **/
    static var outline(default, never) = new Property<TODO>("outline");

    /**
        <span class="type">number | vector3</span> label scale.
        
        The scale of the label. The type of the property is number (uniform)
        or vector3 (non uniform).
    **/
    static var scale(default, never) = new Property<TODO>("scale");

    /**
        <span class="type">vector4</span> label shadow.
        
        The shadow color of the label. The type of the property is vector4.
    **/
    static var shadow(default, never) = new Property<TODO>("shadow");

    /**
        <span class="type">vector3</span> label size.
        
        Returns the size of the label. The size will constrain the text if line break is enabled
        The type of the property is vector3.
    **/
    static var size(default, never) = new Property<TODO>("size");
}