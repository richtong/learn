# Blender Tutorial

Using the doughnut tutorials from YouTube for Blender 3.0 running on Blender 3.3
for the Mac.

## Preference setup: Emulate Number Pad and Multitouch Gesture for MacBooks

Here are some convenient things to set. In Edit Preferences > Input > Emulate
Numpad, let the regular 0-9 keys be the same as the Numpad keys.

By default, the [Multitouch](https://developer.blender.org/T30746) so that the
two finger scroll is:

1. One finger just moves the cursor around
1. Two finger move is a rotate event so the Viewport rotates around the cursor
1. Shift with two finger move is a pan event back and forth. It is actually not
   a full pan, but a pan that is actually around a center point.
1. Pinch in and out gesture is a zoom in and out and is the same as CTRL or ALT with
   two finger move.

## Moving around Blender Viewport and the Pivot points

One of the strangest things about blender is that in most applications, if you
click and move the mouse, you move the "Pivot" point that is when you use the
two finger move then you rotate around that point. This

Blender does not work this way it has a hard pivot point which is set at the 3D
cursor. There is an icon on the right with a hand which moves the View(port).
You can also get this with a Shift key and then two fingers to move it. Two
fingers in and out zoom.

There are some other points that matter which is the origin of an mesh. That
you can set for where the origin point of an object that is where it grows
from. Normally the center of it. This is called the pivot.

## Select Object different from Outline and click on it

There does not seem to be a reliable way to select an object. Going to the
outline view seems to select an object but you have to actually click it. If
you select an object with the click, the G works as does SHIFT-G, but not if
you select in Outline view

## Moving objects

The easiest thing is to use the G key or more properly choosing SHIFT-SPACE and
then g, this will put you in move mode. The click and you You can then move the
previously selected object and then click again to end the motion. Or ESC or
right click to cancel the motion.

If you just want to move up then type GZ and it will lock motion up and down.
Same for GX and GY.

If objects are far flung, select them on the object Outliner on the far right
and select ALT-G to move the object to the center then G to move it to the
right place. Note that if something is already at the origin then a Move G will
move everything if Proportional Editing is on, then everything in the
proportional circle will also move.

Alternatively when you click on an object, you can look in its properties and
manually change the X, Y and Z position.

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

Smooth is SHIFT-S and has the same 'F' and CTRL-F and it removes bumps.

'I' is inflate and if you turn on Airbrush with 'N' which opens up properties
in the same window, and then there menus are vertical and look for brush, you
can flip it to Airbrush. The same properties are in the right slice under the
tool icon which is Active Workspace and Tools setting, then you can set the
Stroke Method to Airbrush from the default. This basically expands a mesh so
that it literally just gets bigger and inflates. This is one place where having
a stylus and pen interface is great for measuring pen pressure.

## Rendering the model with Render Image

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
middle. Then hide the doughnut and move it. Note that moving things is select with
a click then hit G to move it.

## Change the Camera to the Viewport

To get the camera to the right position, then simplest way is to do a
OPTION-COMMAND-NUMPAD-0 and this actually runs Object Mode / View / Align View
/ Align Active Camera to View and it will make whatever your current Viewport
the same as your active Camera.

Once you are close, you can also make sure your Viewport is the same as the
camera, so as you move the Camera moves as well. Use N to open up the viewport
parameters and the View > Lock > Lock Camera to View to fine tune it.

## Change the light intensity and view port display

Once the light is there, you can go to the properties and turn the wattage so
it looks good.

Also the size of the camera viewpoint is going to need to be adjusted, click on
the camera and then look in the properties and change the size of the
viewport. Go to the Camera Properties > View Port Display > Size and change it
from the default 1 meter.

## Making Eevee more realistic and Flipping between Eevee and Cycles

If you go to the Properties / Render, you can choose Cycles which is very
realistic. If you do this it is slower and you need to enable GPU in Scene >
Device > GPU Compute for it to really work. You can

Alternatively, you can make Eevee slower but more realistic by turning on:

1. Properties > Render Properties > Scene > Render Engine Eevee
1. Properties > Render Properties > Shadows > Cube Size > 4096px this sets how
   it handles light, the more pixels the better but slower
1. Bloom you can turn on to show more glare from bright objects
1. Screen Space Reflections to get more well reflected light

Then in the light itself, when you select Eevee you get some more properties,
in particular in Properties > Object Properties , select the Light / Shadow
and lower the Bias to 0.010 this sets how far the shadows go.

Overall, if you have fast enough machine, then Cycles is a nice choice rather
than all this putzing about.

As a trick, if you select at the upper right Viewport Shading > Material
Preview and then in the Options turn on use Scene Lights and Scene World then
this is the same view as Eevee, so that you have two buttons and can flip
between Eevee in Material Preview and then next door neighbor which is Viewport
Shading > Render.

The default for Cycles is that is relatively course, it uses Monte Carlo
simulation to pick the rays that it is tracing, so you get graininess. The
default is Sampling > Viewport > Max Samples which is set to 1024. It is going
to look grainy, but you can turn on Denoiser in Properties > Render Properties
and then you can just use 100 samples and turn on denoising to make it much
faster. You then leave the Sampling > Rendering at a high 4096 samples to get a
nice image when you done.

Note that on a MacBook, this is CPU based, so you want to set the Denoise Start
Sample at say 48 so it isn't slow

## Changing Material of a Mesh

Go to the Object Properties and down at the bottom there is Material
Properties. Choose New and you will get by default
BSDF which is a Disney paper that make creating materials look very natural.
Then choose Base Color and pick a nice pink. Then Roughness which sets the
glossiness of the material. How nicely iced do you want

When material actually is translucent you get scattering, so you want to add
Subsurface and the values are in meters which in this case to 0.1 which sets
the intensity of the scattering.
Then, set how large the scattering is going to be with
Subsurface Radius at 0.002 meters you can set it to the same for
the three parameters which are for RGB as different materials may scatter
differently. And then set the Subsurface color to a darker version of the
original material. This makes sense it is going to go through and get darker.

## Rendering and Image and Slots for remembering

Because rendering takes some time, when you choose Render / Render Image, in
the new window, there are slots, so you can keep old renders and not have to
keep creating them. You set them and the next time you render, it goes into the
last selected Slot.

## Using PureRef to drag and drop images from the Web

One side note is that a DonateWare application
[PureRef](https://www.pureref.com) is what most professionals use to store
images.

## Texturing a Material by Node Editing

You can edit individual areas by going to Shading Mode and then removing the
directory window on the left and the other one and you will have the Doughnut.
You can remove the Icing with H and get it back with OPTION-H

Nodes are really things that modify textures, so drop into the node editor as
noted above. The node processing is left to right, so choose the lower Node
Editor windows go to Add > Texture > Voronoi Texture and you will see a new
property list appear and then you will see that you can connect Distance to the
Base Color, so the Texture replaces the solid color that used to be there.

So you put textures on meshes and with node editors, this remains separate and
you can change it. Note that if you connected it to the Colors output then the
texturing would work on colors instead of distances

## Noise Texture and Color Ramp Pipeline Plus Color Coordinates

So if you connect Noise Texture with the Factor output and then Add a Color
ramp then you can modify the color and have it modify by the noise texture
with Add > Converter > Color Ramp.

Once you add the ramp, the first bar sets the range of colors that are blended
from the right to the left. To set the left color click on it and then you will
see the bar below it turn to that color. Click on the bar and you will get the
color wheel. What is confusing here is that there are no color because the
right slider is turned down to black, so drag tkkhat up and you get the
conventional color wheel.

Then to set the right color click there and it should be for instance black by
default if you want the colors to go from the default white to the default
black.

Then because the texture is wrapped around the object with Generated
coordinates, you fix this by Add > Input > Texture Coordinate and use the
Object output to the Noise Texture vector. Note general the output colors and
input colors should match as they are the type of the data being transferred.
Note that when you add this, you need to scale up the noise to 150 or more from
15.

## Using the Node Wrangler to see one stages

You can enable an add-on by going to the top window Edit > Preferences > Add-on
and then searching for Node Wrangler, this adds some nice shortcuts. And now
CTRL-SHIFT-CLICK on any node will just show you the output of that node.

## Using a JPEG image as a Texture

You can take any image and apply it to any mesh with Add > Texture > Image
Texture, click on Open and this will let you browse for any image on your
machine and apply it to the texture.

## Using Noise to drive the Bumps for Normal Maps

You can take the same noise texture and it drive Add > Vector > Bump and then
connect that to the Color output of the Noise Texture to the Height input of
the Bump Node. The Normal tells how the texture is applied
to the mesh and it can deviate from the mesh for a more realistic appearance.
And you take the Bump Normal and apply it to the Texture Normal input.

Now change the bump distance to 2cm or 0.002

## Tutorial 8. Texture painting

To add a stripe to the side of the doughnut, you can just paint a texture that
already exists. So find an image with Add > Image > Texture
