import draw, mouse, color --External libraries used by the file

Widget[..] widgets; --List of widgets (growing array)

class Rect(int x, int y, int w, int h) --Define simple rect class
    bool inBounds(Rect r) => (x >= r.x) && (x < (r.x + r.w)) && (y >= r.y) && (y < (r.y + r.h)) --Check if one rect is inside another's bounds
end

class Widget(int x, int y, int w, int h) := Rect() :: Interact --Define widget inheriting from rect and passing args via super, with Interact trait
    color = color.Grey --Define new member color
    void init()
    void draw() => drawRect(x, y, w, h, color) --Use drawRect from the imported draw lib
end

trait Interact --Define new interact trait with one void method
    void onHover()
end

class Console(str id) := Widget() --Extending Widget: := denoting it requires and passes the params
    void onHover(bool state) => color = state ? color.LightGrey : color.Grey --Overriding the onHover method from the Interact trait
    void draw() => @.draw(); y-- --Override the draw method, while also calling super, and decrementing the y coord
end

void onInit() --Init method called only once
    widgets += Widget(0, 0, 400, 400) --Instantiate standard widget
    widgets += Console("console.1", 0, 300, 100, 400) --Instantiate custom widget
    widgets.in(w => w.init()) --Init all widgets
end

void onUpdate() --Update method called every frame
    widgets.in(w => w.onHover(mouse.r.inBounds(w.r)); w.draw()) --Iterate over all Widget objects in list, Call trait method and pass value
end
