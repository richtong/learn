# Blender Tutorial

Using the doughnut tutorials from YouTube for Blender 3.0 running on Blender 3.3
for the Mac.

## Blender notes Object and properties on the right

There are many different command keys that you have to memorize and lots of
different screen layouts, but the main idea is that the right pane has the
various currently active object list. The confusing this is that the modifiers
are only listed if you click on the Wrench which is modifier properties.

And these properties you select by going to the box icon above it which is
called the Object Properties. You can't just select from the Scene Collection
which is called the Outline
and get the properties, you have to go to the Box icon to select them. That is
because the Collections are in a separate window and they are not tied to the
object panel

## Windowing is Weird

The windowing is very subtle. Basically you create a new window by going to the
upper right corner of any existing window and you will see a big cross hair. As
soon as you click and drag over it, creates a new window. And then you drag to
where you want it. The properties of each window are changeable by clicking on
the upper right and the down arrow and you can create whatever you like.

To get rid of windows, you go to the upper right and there is an arrow and you
can drag over and the window overwrites the one next to it. You can also right
click there and you get vertical split and horizontal split etc, but most of
the time you can just specify it.

It is definitely confusing that in the default layout on the right they look
like linked property pages, but these are really separate windows

See [YouTube](https://www.youtube.com/watch?v=HSm-cq7zd2s) for more details.

## Modifiers creating and then applying

The way this works is that when you select the object in the right pane and
then you can choose add modifier. The modifiers are there and are seen but
disappear when they are applied. So you can seen what the effect is and then in
object mode you can apply. Note this doesn't work in edit mode.

## Creating and moving objects

You do this with in the Object mode by choosing the second layer of menus from
the top which are the mode specific menus, Add > Mesh > Torus adds a doughnut.

You can move this by 'G' for Go (this also works in edit mode, see below). 'R'
is rotate, 'T' to transform. Make sure that when you add, you apply the scale
so it is always "1.0" with Right click and the Apply. The 'N' key opens up the
Transform and tells you the scale and so forth.

To move around if you click on the upper right collect of axes, then you get
orthographic views which are pure 2D views. You can switch from perspective to
orthographic views by clicking on the icon on the middle right that looks like
a grid.

## Edit Model

There are zillion options here, but the most important is the 'O' which sets
proportionality so there is a gray circle and you can have multiple points
applied. The toolbar at the top tells you what is being applied.
The important things are the proportion on a Track Pad seems to work
differently, with a mouse, the scroll wheel controls it. With a track pad, if
you just click then fingers up and down widen and shrink.

Then there is the Snap to model which is the magnet at the top. This snaps to a
grid. Although I could not get this to work on a Track pad.

## Editing things

You hit the TAB to go between edit and object mode. In edit mode, you click and
SHIFT-click on grid points and then you can move them by hitting the G key.

## Layout and Workspace in general

You start out in the Layout workspace and on the top row, you can see all the
various workspaces with Layout at the left. If you move to Sculpting.

The default is Draw which you get with an 'X' and this lets you push in and
with CTRL click it pushes things.

The most useful is 'G' and then clicking on a location. Then you set the radius
with 'F' and then  just moving the mouse will change the Radius of the Grab
effect and SHIFT-F and then moving the mouse changes the strength. Then to
actually make it work  it is click and move the mouse and.

Smooth  is SHIFT-S and has the same 'F' and CTRL-F and it removes bumps.

'I' is inflate and if you turn on Airbrush with 'N' which opens up properties
in the same window, and then there menus are vertical and look for brush, you
can flip it to Airbrush. The same properties are in the right slice under the
tool icon which is Active Workspace and Tools setting, then you can set the
Stroke Method to Airbrush from the default. This basically expands a mesh so
that it literally just gets bigger and inflates. This is one place where having
a stylus and pen interface is great for measuring pen pressure.

## Rendering the model with

You can render the mesh with Render > Render Image, but you should first
position the camera and the light. So CTRL-ALT-NUMPAD-0 if you have one, but if
you don't have it or if you do not have an extended keyboard, the command is
Object Mode > View > Align View > Align Active Camera to View.

If you want to see the way the object is with the lighting, then at the upper
right, you have four Viewport options: wire frame, solid, material preview and
rendered so you do not have to keep rendering it. The quick keyboard shortcut
is Z (for Z ordering) to 2, 4, 6 and 8 to get these same views.

## If you lose orientation then View > Center View to Cursor is your friend

Because there is always a center point where you rotate around, you need an
easy way to change it. The easiest thing to do is to click on something and
then choose Object Mode > View > Center View to Cursor to get everything
working properly.

One problem with the camera view is that you can be too close to the camera and
you can lose the object, so do not zoom in too close.

Once you have the camera is the right place, then you can to the tools menu
with 'N' and choose View and then View Lock > Camera to View Lock.

To grab the light, just selection OPTION-G and it will move the light to the
middle. Then hide the donut and move it. Note that moving things is select with
a click then hit G to move it.

## Change the light intensity and view port display

Once the light is there, you can go to the properties and turn the wattage os
it looks good.

Also the size of the camera viewpoint is going to need to be adjusted, click on
the camera and then look in the properties and change the size of the
viewport. Go to the Camera Properties > View Port Display > Size and change it
from the default 1 meter.

## Changing rendering engine parameters

This is in the Properties windows in the left side where there is the back of a
camera icon that is the Rendering Engine section. Workbench is the toy, but
Eevee is a real-time rendering engine, Cycles takes longer and has grain it is
a raytracer and more accurate.

## Make sure you are using GPU acceleration

With a Mac, you are using Metal acceleration and you can see this in Edit >
Preferenses > System
