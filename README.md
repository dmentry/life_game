# Game of Life
My implementation of the Game of Life. It is is not typical computer game. It is a cellular automaton and was invented by Cambridge mathematician John Conway.

It consists of a collection of cells which, based on a few mathematical rules, can live, die or multiply. Depending on the conditions, the cells form various patterns throughout the course of the game.

## Rules
For a space that is populated:

* Each cell with one or no neighbors dies, as if by solitude.

* Each cell with four or more neighbors dies, as if by overpopulation.

* Each cell with two or three neighbors survives. For a space that is empty or unpopulated

* Each cell with three neighbors becomes populated.

![Application screenshot](https://github.com/dmentry/life_game/blob/master/Life.gif)

## Main requirements
* Ruby

## Run

```
life.rb
```
## Change field size
Game field is set to 20x20. It could be changed by changing `LENGTH` value.

## Add/change cells
Set the desired figure by setting value `*` in array before the main game cycle

```
@arr[1][3]='*'
@arr[2][4]='*'
...
```
