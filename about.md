---
layout: default
title: About
---
# About Me

Test syntax highlighting.

{% highlight python %}

import copy

# verb, no noun, just print out the description of the room and objects
def describe():
    room = current_room
    print(rooms[room]["description"])
    # print out each object
    for obj in rooms[room]["objects"]:
        print("There is a %s here" % obj)

# verb, one noun
def go(direction):
    # change the current room
    global current_room
    # check we can go that way
    if direction in rooms[current_room]["exits"]:
        # if so, update location and describe it
        current_room = rooms[current_room]["exits"][direction]
        describe()
    else:
        print("I can't go %s" % direction)

# verb, one noun
def take(obj):
    if obj in rooms[current_room]["objects"]:
        inventory[obj] = rooms[current_room]["objects"][obj]
        print("You take the %s" % obj)
        del rooms[current_room]["objects"][obj]
    else:
        print("I don't see %s" % obj)

# verb, one noun
def drop(obj):
    if obj in inventory:
        rooms[current_room]["objects"][obj] = inventory[obj]
        del inventory[obj]
    else:
        print("I don't have %s" % obj)

# verb, no noun
def list_inventory():
    print("I'm carrying:")
    print("\n".join(list(inventory.keys())))

# verb, no noun
def exits():
    print("\n".join(rooms[current_room]["exits"]))

# examine the object, checking first the inventory, and then the objects in the room
def examine(obj):
    if obj in inventory:
        print(inventory[obj])
    elif obj in rooms[current_room]["objects"]:
        print(rooms[current_room]["objects"][obj])
    else:
        print("I can't see %s" % obj)

keep_going = True

def quit():
    global keep_going
    keep_going = False

# map verbs to functions: these could also map to tuples (fn, number_of_nouns)
actions = {
    "go": go,
    "take": take,
    "drop": drop,
    "inventory": list_inventory,
    "exits": exits,
    "examine": examine,
    "look": describe,
    "quit": quit
}

# no real alternative to using some form of global
# vars, since objects and inner scopes haven't
# been introduced
def game():
    global current_room, inventory, rooms, keep_going
    keep_going = True
    current_world = copy.deepcopy(world)
    current_room = current_world["start_room"]
    inventory = current_world["start_inventory"]
    rooms = current_world["rooms"]
    describe()
    while keep_going:
        # get input
        command = input(">")
        elements = command.split()
        if len(elements) > 0:
            verb = elements[0]
            if verb in actions:
                # no noun verbs
                if len(elements) == 1:
                    actions[verb]()
                # one noun verb
                elif len(elements) == 2:
                    noun = elements[1]
                    actions[verb](noun)
            else:
                print("I don't know how to %s" % elements[0])

        print()

game()

{% endhighlight %}
