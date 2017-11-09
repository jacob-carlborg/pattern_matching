module pattern_matching;

import std.stdio : println = writeln;

auto match(patterns ...)()
{
    import std.traits : isType;

    static assert(patterns.length >= 1, "Missing value for match");
    static assert(patterns.length >= 2, "At least one pattern must be " ~
        "supplied to match");

    enum paramIsType = isType!(patterns[0]);
}

void main()
{
    match!(3,
        (x) => println("variable pattern"),
        (int x) => println("typed pattern"),
        (int) => println("typed pattern, non capturing"),
        int, (x) => println("typed pattern, second form"),
        int, () => println("typed pattern, second form, non capturing"),
        3, (x) => println("literal pattern"),
        3, () => println("literal pattern, non capturing"),
    );
}
