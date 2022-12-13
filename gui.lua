--External libraries used by the file
import draw, mouse, color

--List of widgets (growing array)
Widget[..] widgets;

--Define simple rect class
class Rect(int x, int y, int w, int h)
    bool inBounds(Rect r) --Check if one rect is inside another's bounds
        return (x >= r.x) && (x < (r.x + r.w)) && (y >= r.y) && (y < (r.y + r.h))
    end
end

--Define base widget class inheriting from rect and passing params to it via super
--Also using the trait Interact
class Widget(int x, int y, int w, int h) := Rect() :: Interact
    color = color.Grey --Define new member color
    void init()
        --//NO-OP
    end
    void draw() --Define draw method
        drawRect(x, y, w, h, color) --Use drawRect from the imported draw lib
    end
end

--Define new interact trait with one void method
trait Interact
    void onHover()
end

--Define new widget class
class Console(str id) := Widget() --Extending Widget: := denoting it requires and passes the params
    void onHover(bool state) --Overriding the onHover method from the Interact trait
        color = state ? color.LightGrey : color.Grey --Setting member with ternary operator
    end
end

--Init method called only once
void onInit()
    widgets += Widget(0, 0, 400, 400) --Instantiate standard widget
    widgets += Console("console.1", 0, 300, 100, 400) --Instantiate custom widget

    widgets.in(w > w.init()) --Init all widgets
end

--Update method called every frame
void onUpdate()
    for Widget w in widgets --Iterate over all Widget objects in list
        w.onHover(mouse.r.inBounds(w.r)) --Call instance method (defined by trait) and passing value
        w.draw() --Call instance method
    end
end
