--External libraries used by the file
import draw, mouse, color

--List of widgets (growing array)
Widget[..] widgets;

--Define simple rect class
class Rect(int x, int y, int w, int h)
    --Check if one rect is inside another's bounds
    bool inBounds = Rect r > (x >= r.x) && (x < (r.x + r.w)) && (y >= r.y) && (y < (r.y + r.h))
end

--Define base widget class inheriting from rect and passing params to it via super
--Also using the trait Interact
class Widget(int x, int y, int w, int h) := Rect() :: Interact
    color = color.Grey --Define new member color
    void init()
    --Define draw method
    void draw() => drawRect(x, y, w, h, color) --Use drawRect from the imported draw lib
end

--Define new interact trait with one void method
trait Interact
    void onHover()
end

--Define new widget class
class Console(str id) := Widget() --Extending Widget: := denoting it requires and passes the params
    --Overriding the onHover method from the Interact trait
    --Setting member with ternary operator
    void onHover = bool state > color = state ? color.LightGrey : color.Grey
end

--Init method called only once
void onInit()
    widgets += Widget(0, 0, 400, 400) --Instantiate standard widget
    widgets += Console("console.1", 0, 300, 100, 400) --Instantiate custom widget
    widgets.in(w > w.init()) --Init all widgets
end

--Update method called every frame
void onUpdate()
    --Iterate over all Widget objects in list
    --Call instance method (defined by trait) and passing value
    widgets.in(w > w.onHover(mouse.r.inBounds(w.r)); w.draw())
end
