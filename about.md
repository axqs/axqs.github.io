---
layout: default
title: About
---
# About Me

Test syntax highlighting.

### Header 3: With Python

{% highlight python %}

import copy

# verb, no noun, just print out the description of the room and objects
def describe():
    room = current_room
    print(rooms[room]["description"])
    # print out each object
    for obj in rooms[room]["objects"]:
        print("There is a %s here" % obj)

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

### Header 3: With Java

{% highlight java %}

public class Player {

	private int coins;
	private Set<GameCharacter> characters;

	/**
	 * Creates new Player with given properties
	 */
	public Player(int coins, Set<GameCharacter> characters) {
		this.coins = coins;
		this.characters = characters;
	}

	//Getter methods
	/**
	 * Gets the amount of coins the player has
	 * @return int players coins
	 */
	public int getCoins() {
		return this.coins;
	}

	private Set<Power> neededPowers(Set<GameCharacter> currentCharacters, Set<Power> powers){
  		Set<Power> currentPowers = new HashSet<>();
  		currentCharacters.stream().forEach(c -> currentPowers.addAll(c.getPowers()));
  		Set<Power> needed = powers.stream().filter(p -> !currentPowers.contains(p)).collect(Collectors.toSet());
  		return needed;
	}

	private boolean canUse(GameCharacter gc, Set<Power> powers) {
		for(Power p : gc.getPowers()) {
			if(powers.contains(p)) {
				return true;
			}
		}
		return false;
	}


{% endhighlight %}

### Header 3: With HTML

{% highlight html %}

<!-- practice html -->

<span class="kd">public</span> <span class="kt">int</span> <span class="nf">getCoins</span><span class="o">()</span> <span class="o">{</span>
  <span class="k">return</span> <span class="k">this</span><span class="o">.</span><span class="na">coins</span><span class="o">;</span>
<span class="o">}</span>

{% endhighlight %}
