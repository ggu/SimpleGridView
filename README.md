# Simple Grid View
A grid view (the kind of symmetrical grid you'd use for a pathfinding application or a game of some sort) based around UIKit. I am currently working on a visual pathfinder in Swift with this as a base, separate from any sort of pathfinding AI.

# The Code
- TileView is a UIView subclass that stores a Tile and handles active and inactive state changes (the defaults I have set for this app, but you might have various states like inactive, target, obstacle, start etc..). The tile width, height, and margins are also managed here.

- GridView is another UIView subclass that handles a 2D list of TileView and manages the touches. Touches are currently handled here (e.g. you tap or swipe over TileViews and modify their state). I am not sure if I would be able to handle the touches in TileView, which would be ideal but touchesmoved is currently stopping me from doing that as touchesmoved holds onto the original view, and would not be called on other TileViews. If your app does not depend on swipes over the grid, then I might move the touches functionality to the TileView to obstract more away from GridView. traverseGrid is the core method you will use to update tile states for some condition (e.g. when swiping, does tile frame contain swipe location?) or for applying a state to the entire grid, otherwise accessing the tile you need directly with grid[x][y] makes the most sense.

- Tile is a struct that is meant to hold the properties that your application's logic would want to track. If this were for a game, a tile might have a property for its height on your map (e.g. forests are of height 1, mountains are of height 10 etc) to tie into your game's formula for unit movement. Or if you were strictly pathfinding, you might add a property just for risk. As far as a Tile's State goes, this is for tracking the possible states of your tile. Maybe it could be an obstacle, or a dynamic obstacle with some risk. Or even your goal tile. For now, tiles are strictly represented as active or new/inactive.

- Constants.swift houses some of the main values you might want to edit (colors, possible tile states). One very important enum is Condition. You will pass in a Condition type into traverseGrid as well as a value that can be of any type and these together will allow you to use traverseGrid flexibly to do a variety of things (maybe you want to check if the tile has risk < 10 for your pathfinding, so you could create a Condition case for risk and then you could add another switch case within traverseGrid so that if your Condition is risk, you could pass in a value for risk and check the tile's risk against the unwrapped optional risk value passed into traverseGrid).

# Usage 
Drag and drop GridView.swift, TileView.swift, Coordinate.swift, Constants.swift and Tile.swift into your project. Alternatively, you can add this as a git submodule.

Wherever you need a grid:
```
let gridView = GridView(size: gridSize)
view.addSubview(gridView)
```

# Simple demo
The demo is not really representative of what this is meant to be used for, but it's there so you can see at a glance what this looks like with the default constants.

![Image of Demo1]
(https://github.com/ggu/grid-view-/blob/master/demo1.gif)

# To Do

- support for panning around a grid larger than the screen 

- make a version with SpriteKit instead of UIKit (for apps that need to represent the world with SKNodes instead of UIViews)
