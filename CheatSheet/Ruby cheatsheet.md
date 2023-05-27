### Control Structure

```ruby
if [conditional] ...
else ... end
---------------------------------
[conditional] ? true block ... : false block ...
---------------------------------
if [conditional] ...
elsif [conditional] ...
else ... end
---------------------------------
while [conditional] ... end
---------------------------------
until [conditional] ... end
---------------------------------
case someVar
when [condition] ...
when [condition] ...
(as many whens as needed)
else ... end
---------------------------------
someVar.each do |x| ... end
someVar.each {|x| ... }
---------------------------------
for each x in someVar do ... end
```

### General Remarks about the Language

| IRB is an intera­ctive Ruby Shell good for starting out. ($ irb) |
| ------------------------------------------------------------ |
| Ruby does not need to be compiled (most of the time) since it is interp­reted. |
| Everything in Ruby is an object.                             |
| Ruby variables don't have types - only objects do.           |
| Ruby wants you to omit ()'s and ;'s                          |
| Ruby will make you happy so enjoy.                           |

### Variable Classi­fic­ations

| variab­le_name    | Local Variable    |
| ----------------- | ----------------- |
| VARIABLE          | Constant Variable |
| @varia­ble­_name  | Instance Variable |
| @@vari­abl­e_name | Class Variable    |
| =                 | Assignment        |

Everything is an object so variables do not have explicit data types

### Constants

| __FILE__        | Filename of current source code file        |
| --------------- | ------------------------------------------- |
| __LINE__        | Current line                                |
| __END__         | End of Ruby code (ignore everything below)  |
| DATA            | Anything below __END__ as an IO/File object |
| ENV[]           | Environment Variables                       |
| ARGV[ ] ARGF[ ] | Command Line Arguments                      |

### Exceptions

Try a block of code and catch possible exceptions

`begin`
`...`
`rescue exception => variable`
`...`
`else`
`...`
`ensure`
`...`
`end`

Figure 1 shows the Exception hierarchy.

![Exception hierarchy](/Users/liubomyrzhovtulia/RubymineProjects/prometheusRuby/CheatSheet/15049-thumb.png)



### Strings

| .length              | Length of the String                                         |
| -------------------- | :----------------------------------------------------------- |
| .count­(param)       | How many times the param appears in the String               |
| .inser­t(pos, param) | Inserts the param in the position of the String              |
| .upcase              | Converts all characters to uppercase                         |
| .downcase            | Converts all characters to lowercase                         |
| .swapcase            | Converts all uppercase characters lowercase & lowercase to uppercase |
| .c­ap­italize        |                                                              |
| .reverse             | Reverses the order of the characters                         |
| .split               | Breakes up a String on whitespace and stores all those strings in an array |
| .chop                | Removes the last character                                   |
| .strip               | Removes all whites­pace, tabs, new lines & carriage returns  |
| .chomp               | Removes the last character if it's a new line or carriage return |
| [start, end]         | Returns a substring                                          |
| .to_i                | Converts to integer                                          |
| +                    | Concat­enates strings                                        |
| .index­(po­sition)   | Returns the character in the specified position              |
| .clear               | Removes all content                                          |





### Operators

| Arithmetic | Operators                                                    |
| ---------- | ------------------------------------------------------------ |
| +          | Addition                                                     |
| -          | Subtra­ction                                                 |
| *          | Multip­lic­ation                                             |
| /          | Division                                                     |
| %          | Modulus                                                      |
| **         | Exponent                                                     |
| Compare    | Operators                                                    |
| ==         | Values Equal?                                                |
| !=         | Values Not Equal?                                            |
| >          | Left op greater than Right op?                               |
| <          | Left op Less than Right op?                                  |
| >=         | Left op greater than or equal to Right op?                   |
| <=         | Left op less than or equal to Right op?                      |
| <=>        | Spaceship: returns 0 if ops are equal, 1 if Left op is greater than Right op and -1 if Left op is less than Right op |
| ===        | A case compar­ative for when control structure               |
| .eql?      | Values Equal for both type and value?                        |
| .equal?    | Values are the same object?                                  |
| Logical    | Operators                                                    |
| and, &&    | AND                                                          |
| or, \|\|   | OR                                                           |
| not, !     | NOT                                                          |

### Regular Expressions

| .                | Any character (excluding newlines)                |
| ---------------- | ------------------------------------------------- |
| [...]            | Any single character in set                       |
| [^...]           | Any single character not in set                   |
| *                | Zero or more                                      |
| +                | One or more (to as many as possible)              |
| +?               | One or more (to as few as possible)               |
| ?                | Zero or one                                       |
| \| (pipe symbol) | Alternatives (e.g. a\|b\|c will match a, b, or c) |
| (...)            | Group                                             |
| ^                | Beginning of line or string                       |
| $                | End of line or string                             |
| {n, m}           | n to m (as a quantity)                            |
| (?>...)          | Atomic group                                      |
| (?=...)          | Lookahead                                         |
| (?!...)          | Negative lookahead                                |
| \N               | Back reference N (where N is a digit)             |
| \A               | Beginning of a string                             |
| \b               | Word boundary                                     |
| \B               | Non-word boundary                                 |
| \d               | Digit                                             |
| \D               | Non-digit                                         |
| \s               | Whitespace                                        |
| \S               | Non-whitespace                                    |
| \w               | Word-character (alphanumeric)                     |
| \W               | Non-word-character                                |
| \z               | End of a string                                   |
| \Z               | End of string, before newline                     |
| /.../imx         | Case insensitive, multiline, ignore whitespace    |

### Arrays

| data_set = []Sets an empty array, and also clears out existing array |
| ------------------------------------------------------------ |
| data_set = [“a”, “b”, “c”]Sets an array with data            |
| data_s­et[1]Returns data from the defined positi­oned.       |
| data_s­et[0] = “d”Sets the value of the element with key 0 to d |
| data_set << “e”Appends the data to the array                 |
| data_s­et[1] = nilRemoves data from an array                 |
| data_s­et.c­learClears out an array                          |

### Arrays

| array = Array.n­ew­(le­ngt­hParam)  | Creates array where each element is NIL                      |
| ----------------------------------- | ------------------------------------------------------------ |
| array = [element1, element2, ...]   | Creates array with the specified elements                    |
| array[­index]                       | Returns the element value at index                           |
| array.l­ength                       | Returns the size of the array                                |
| array.push param <<                 | Adds the params as separate elements to the end of the array |
| array.pop                           | Removes the element from the end                             |
| array.u­nshift param                | Adds the params as separate elements to the front            |
| array.s­hift                        | Removes the element from the front                           |
| array.r­everse                      | Reverses the order of elements                               |
| array.s­huffle                      | Randomly shuffles up order of elements                       |
| array.sort                          | Sorts the array of elements                                  |
| x = “1,2,3­,4,5”; y = x.spli­t(‘,’) | This will return an array, separating each value by comma.   |
| array.i­nc­lude? param              | Returns true if the param exists in the array                |
| array.uniq                          | Returns an array of only the unique elements                 |
| array.u­niq!                        | Will update the array with the new version in place.         |
| array.fill param                    | Sets all the array elements to the param                     |
| array.each {\|x\| ...}              | Iterates over each element in the array                      |
| array.e­ac­h_i­nde­x{\|i\| ...}     | iterates over each index in the array                        |
| array.i­nspect                      | Will return a string repres­ent­ation of the array           |
| array.j­oi­n(",­")                  | Will implode the array by comma.                             |
| array.sort                          | Will sort your array asc order                               |
| array.d­el­ete­_at(2)               | Will delete the element based on key and return the value that it it deleted. |
| array.d­el­ete(4)                   | Will delete the element based on value                       |

A single array can hold elements of different object types.

### Hashes

| map = Hash.new                                          | Creates an empty hash map                                    |
| ------------------------------------------------------- | ------------------------------------------------------------ |
| map = Hash.n­ew(­def­ault)                              | Creates an empty hash map where if key or value cannot be found, default value is returned. |
| map = Hash["k­ey1­" => value1, "­key­2" => value2, ...] | Creates a hash map with 2 key-value pairs                    |
| map = Hash["k­ey1­" => value1, "­key­2" => value2, ...] | Creates a hash map with 2 key-value pairs                    |
| map["ke­y3"] = value3                                   | Adds a key-value pair to the map                             |
| map.ha­s_key? key                                       | Returns true if the key exists as a key in the hash map      |
| maps.h­as_­value? value                                 | Returns true if the value exists as a value in the hash map  |
| map.fetch key                                           | Returns the value that corres­ponds to the key               |
| map.delete param                                        | Deletes the key-value pair with the key param                |
| map.length                                              | Returns the number of key-value pairs in the hash map        |
| map.keys                                                | Returns an array of all the keys in the hash map             |
| map.values                                              | Returns an array of all the values in the hash map           |
| map.sort                                                | Sorts the keys of the hash map in alphab­etical order        |
| map.in­spect                                            | Returns the current state of the hash map                    |
| map.each {\|k, v\| ... }                                | Iterates over each key-value pair in the hash map            |
| map.ea­ch_key {\|k\| ... }                              | Iterates over each key in the hash map                       |
| map.ea­ch_­value {\|v\| ... }                           | Iterates over each value in the hash map                     |
| map.ea­ch_­value {\|v\| ... }                           | Iterates over each value in the hash map                     |

### Hashes

| mixed = {1 => [‘a’, ‘b’, ‘c’], ‘hello’ => ‘world’, [10,20] => ‘top’}You can have mixed values in hashes. |
| ------------------------------------------------------------ |
| mixed.keysReturns all of the keys                            |
| mixed.v­aluesReturns all of the values                       |
| mixed.l­engthReturns the length of the hash                  |
| mixed.sizeReturns the length of the hash                     |
| mixed.to_aConverts the hash to an array                      |
| mixed.c­learWill return an empty hash                        |
| mixed = {}Will return an empty hash                          |
| mixed.k­ey­('w­orld')Will return the key of the hash value.  |
| mixed[­'test'] = 'value'Will add/set value to hash.          |
| mixed[­[10­,20]]Returns the value for the hash key which is [10,20] |

### Ranges

| range = Range.n­ew­(start, end) | Creates a new Range from the starting point to the end point |
| ------------------------------- | ------------------------------------------------------------ |
| range = start..end              | Creates a range from start to end inclusive                  |
| range = start...end             | Creates a range from start to end exclusive                  |
| range.to_a                      | Converts a range to an array                                 |
| range.each                      | Iterators through each element                               |
| range.i­nc­lud­e?(­param)       | Returns true if the param exists in the Range                |
| range.last param                | Returns the last element. Param can be added to provide more than just the last. |

Above each function can be used with (start..end) or (start...end) as well

| `x.begin` | Returns the first number. |
| --------- | ------------------------- |
| `x.first` | Returns the first number. |
| `x.end`   | Returns the last number.  |
| `x.last`  | Returns the last number.  |

### Modules and Classes

| `module Name`<br/>...<br/>`end`                              | Defines a module                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| `class Name < Super`<br/>...<br/>`end`                       | Defines a class with a superclass                            |
| `class << SomeClass`<br/>...<br/>`end`                       | Defines /accesses the singleton class of SomeClass— suited for defining class methods rather than instance methods |
| `include Module`                                             | Includes module in class                                     |
| `def name(arguments)`<br/>...<br/>`end`                      | Defines instance method                                      |
| `def Class.name(arguments)`<br/>...<br/>`end`<br/>`def self.name(arguments)`<br/>...<br/>`end` | Defines class method                                         |
| `public`<br/>`protected`<br/>`private`                       | Methods below are public/protected/private                   |
| `public` symbol<br/>`protected` symbol<br/>`private` symbol  | Methods with names supplied as symbols are public/protected/private |
| `attr` symbols<br/>`attr_accessor` symbols<br/>`attr_reader` symbols<br/>`attr_writer` symbols | Creates accessor methods for all variables given             |
| `alias :new_method_name :method_name`                        | Creates alias for method with name                           |
| `super(arguments)`                                           | Calls same method of superclass                              |

### Class Structure

```
class className1 @instVariable @@clssVariable ... attr_accessor :instVariable  ..     def initialize     ...     end       def classMethod1 param     ...     end end class className2 ... end
```

### Class Details

| Initialize       | A method that is called internally when .new is called to create the object. |
| ---------------- | ------------------------------------------------------------ |
| `attr_r­eader`   | Instance variable getter                                     |
| `attr_w­riter`   | Instance variable setter                                     |
| `attr_a­ccesor`  | Instance variable getter and setter                          |
| `classN­ame.new` | Method called to create the specified object                 |

No overlo­ading methods in Ruby.
Multiple classes can be written in the same file.

### Condit­ionals: if, else, elsif

```ruby
x = 1

if x == 1
  puts "Text here"
end

if x == 2
  puts "Text here"
else
  puts "Text here"
end

if x == 2
  puts "Text here"
elsif x == 1
  puts "Text here"
else
  puts "Text here"
end
```

### Condit­ionals: unless, case

```ruby
x = 1

unless x == 2
  puts "This runs if the above boolean is false."
end

case
when boolean
  puts "Text here" 
when boolean
  puts "Text here"
  else
    puts "Text here"
end

case test_value
when value
  puts "Text here"
when value
  puts "Text here"
  else
    puts "Text here"
end
```

### Inline Condit­ional

```ruby
`puts "test" if name == "Frank"`
```

### Ternary Operator

```ruby
x = boolean ? "test 1" : "test 2"
# This will assign one of the 2 values based on the boolean result.
```

### OR/OR-­EQUALS Operator

```ruby
x = y || z
If y has a value set x equal to y else set it equal to z.
  x ||= y
If x has a value, nothing happens. If it does not then set x to the value of y.
```

### Loops

```ruby
x = 0
loop do
  x+=2
  break if x >= 20
  puts x
end
You can use the following within a loop
break Terminate the whole loop
next  Jump to the next loop
redo  Redo this loop
retry  Start the whole loop over again
```

### Loops: while

```ruby
x = 0
while x < 20
  x += 2
  puts x
end

# You can also use the inline version
x = 0
puts x += 2 while x < 100
```

### Loops: until

```ruby
y = 23245
until y <= 1
  puts y /=2
end

# You can also use the inline version
y = 23245
puts y /= 2 until y <= 1
```

### Loops: for

```ruby
fruits = ['banana', 'apple', 'pear']

for fruits in fruits
  puts fruit.captialize
end
```

### Iterators

| `5.times { puts "Hello" }`           |
| ------------------------------------ |
| `1.upto(5) { puts "­Hel­lo" }`       |
| `5.down­to(1) { puts "­Hel­lo" }`    |
| `(1..5).each { puts "­Hel­lo" }`     |
| `array.each { |num| puts num * 20 }` |

You can use do and end inplace of { }

## Resources

| The official Ruby website           | [http://www.ruby-lang.org](http://www.ruby-lang.org/)        |
| ----------------------------------- | ------------------------------------------------------------ |
| The official documentation          | [http://www.ruby-doc.org](http://www.ruby-doc.org/)          |
| The main Ruby repository            | [http://www.rubyforge.org](http://www.rubyforge.org/)        |
| Wikipedia's overview of Ruby        | http://en.wikipedia.org/wiki/Ruby_(programming_language)     |
| The Ruby mailing lists              | [http://www.ruby-forum.com](http://www.ruby-forum.com/)      |
| Ruby Zone                           | http://ruby.dzone.com/                                       |
| An interactive online tutorial      | [http://tryruby.hobix.com](http://tryruby.hobix.com/) (no download or installation) |
| A Ruby news site                    | [http://www.rubyinside.com](http://www.rubyinside.com/)      |
| A community-powered Ruby news site  | http://www.rubyflow.com/                                     |
| A Ruby-related blog aggregator      | [http://www.rubycorner.com](http://www.rubycorner.com/)      |
| JRuby (Java Ruby Implementation)    | [http://jruby.codehaus.org](http://jruby.codehaus.org/)      |
| IronRuby (.NET Ruby Implementation) | [http://www.ironruby.net](http://www.ironruby.net/)          |