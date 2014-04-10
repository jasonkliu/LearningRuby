Pokemon Assignment
==================


This assignment should be done in the folder `assignments/pokemonclass/YOURNAME`

1. Read [Pine.fm's chapter on Classes](http://pine.fm/LearnToProgram/?Chapter=09)
2. Finish the `Pokemon` class according to the [Requirements](#requirements---data) listed below
  - Add 3 attributes of your choice to the required `Pokemon` attributes.
    - NOTE: These attributes *must* be used in at least one method.
3. Create 3 Pokemon classes that inherit from the `Pokemon` class
  - Each Pokemon must have at least 1 distinct attack / move.
  - At least 1 Pokemon must have >= 3 distinct attacks.
  - 1 Pokemon's attack must have a Power Points (PP) total that is depleted by 1 each time that attack is used. Once the PP total reaches 0, that attack can no longer be used.
    - NOTE: It's probably a good idea to implement this with the Pokemon with at least 3 attacks.
  - Each Pokemon must have its own distinct `cry` which you should set when you initialize the object.
  - Each Pokemon must have its own distinct `name` which you should set when you initialize the object.
  - At least 1 Pokemon must have a move that doesn't `damage`, but rather affects the `defense` of either itself or the `opponent` Pokemon.
4. Choose 2 of your Pokemon classes to battle.
  - Instantiate each Pokemon.
  - Call any of their move methods as if they were "attacking" each other.
  - Keep calling move methods until one Pokemon's `current_health` drops to 0. (You choose which one you want to lose!)
    - NOTE: *Do not write a loop or conditional to automate this.* We want you to manually, procedurally write out each move method call, and stop when you've determined that one Pokemon's health has dropped to `0`.
  - When one Pokemon's `current_health` drops to `0`, `puts` the following message to the console: `"<pokemon.name> has fainted!"`, where `<pokemon.name>` is the defeated Pokemon's `name`.

### General Notes
  - What is object instantiation / initialization? [See this quick tutorial!](http://www.rubyist.net/~slagell/ruby/objinitialization.html)
  - Not familiar with Pokemon? [Check out the Pokemon Database for inspiration!](http://pokemondb.net/pokedex/game/firered-leafgreen)
  - It's totally fine for this to be all in one file.
  - An attack is a move that specifically causes `damage`; a move can have any effect. They don't need to look different in the code (they're both methods!), we're only using these terms in the specification.
  - You can name a move anything you want - be creative!


### Requirements - Data

#### `Pokemon` class


Attribute | Type | Default Value | Description
--- | --- | --- | ---
`name` | String | `"Missingno"` | "You'll need to override this default value when you create your inherited classes.
`current_health` | Integer | None | Instantiated value should be equal to `max_health`
`max_health` | Integer | None | Instantiated value should be some integer between `10` and `999`.
`defense` | Integer | None | The `defense` value is subtracted from the `damage` dealt. Be careful of negative `damage` values - there can only ever be positive `damage` values!
`attack` | Float | None | The `attack` attribute is used as a `damage` multiplier - a Pokemon's `attack` is multiplied by the amount of `damage` dealt.
`cry` | String | `"..."` | When a Pokemon is encountered in battle, it `puts` its battle cry.

#### Pokemon inheriting from class `Pokemon`

Attribute | Type | Default Value | Description
--- | --- | --- | ---
`name` | String | Class name | Default value should be equal to the class name, but you should still be able to set it to another value when you initialize it.

NOTE: You will need to set the values for *all* of these attributes when you instantiate a Pokemon.

### Requirements - Behavior
#### `Pokemon` class

Method Name | Parameters | Return | Action
--- | --- | --- | ---
`damage` | `amount` | `nil` | Reduces the Pokemon's `current_health` by `amount` minus the Pokemon's `defense`.
`full_heal` | None | `nil` | Restores the Pokemon's `current_health` to its original `max_health`
`cry` | None | `nil` | `puts` the Pokemon's cry

#### Pokemon inheriting from class `Pokemon`

Method Name | Parameters | Return | Action
--- | --- | --- | ---
`<move1>` | `opponent` or none | `nil` | Move can have any effect on an opponent's attribute or on itself - you get to choose what attribute!
`<move2>` | `opponent` or none | `nil` | Move can have any effect on an opponent's attribute or on itself - you get to choose what attribute!
`<move3>` | `opponent` | `nil` | Move must affect `opponent`'s `defense`.
`cry` | none | `nil` | `puts` the Pokemon's cry (overwrites the `Pokemon` class method)
NOTE: Remember that each instantiated Pokemon must have unique moves!
