/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sfml2.windowfunctions;

private
{
	import derelict.sfml2.systemtypes;
    import derelict.sfml2.windowtypes;
}

extern(C)
{
    alias nothrow sfContext* function() da_sfContext_create;
    alias nothrow void function(sfContext* context) da_sfContext_destroy;
    alias nothrow void function(sfContext* context,sfBool active) da_sfContext_setActive;
    alias nothrow sfBool function(uint joystick) da_sfJoystick_isConnected;
    alias nothrow uint function(uint joystick) da_sfJoystick_getButtonCount;
    alias nothrow sfBool function(uint joystick, sfJoystickAxis axis) da_sfJoystick_hasAxis;
    alias nothrow sfBool function(uint joystick, uint button) da_sfJoystick_isButtonPressed;
    alias nothrow float function(uint joystick, sfJoystickAxis axis) da_sfJoystick_getAxisPosition;
    alias nothrow void function() da_sfJoystick_update;
    alias nothrow sfBool function(sfKeyCode key) da_sfKeyboard_isKeyPressed;
    alias nothrow sfBool function(sfMouseButton button) da_sfMouse_isButtonPressed;
    alias nothrow sfVector2i function(const(sfWindow)* relativeTo) da_sfMouse_getPosition;
    alias nothrow void function(sfVector2i position,const(sfWindow)* relativeTo) da_sfMouse_setPosition;
    alias nothrow sfVideoMode function() da_sfVideoMode_getDesktopMode;
    alias nothrow const(sfVideoMode)* function(size_t* Count) da_sfVideoMode_getFullscreenModes;
    alias nothrow sfBool function(sfVideoMode mode) da_sfVideoMode_isValid;
    alias nothrow sfWindow* function(sfVideoMode mode,const(char)* title,sfUint32 style,const(sfContextSettings)* settings) da_sfWindow_create;
    alias nothrow sfWindow* function(sfWindowHandle handle,const(sfContextSettings)* settings) da_sfWindow_createFromHandle;
    alias nothrow void function(sfWindow* window) da_sfWindow_destroy;
    alias nothrow void function(sfWindow* window) da_sfWindow_close;
    alias nothrow sfBool function(const(sfWindow)* window) da_sfWindow_isOpen;
    alias nothrow sfContextSettings function(const(sfWindow)* window) da_sfWindow_getSettings;
    alias nothrow sfBool function(sfWindow* window,sfEvent* event) da_sfWindow_pollEvent;
    alias nothrow sfBool function(sfWindow* window,sfEvent* event) da_sfWindow_waitEvent;
    alias nothrow sfVector2i function(const(sfWindow)* window) da_sfWindow_getPosition;
    alias nothrow void function(sfWindow* window,sfVector2i position) da_sfWindow_setPosition;
    alias nothrow sfVector2u function(const(sfWindow)* window) da_sfWindow_getSize;
    alias nothrow void function(sfWindow* window,sfVector2u size) da_sfWindow_setSize;
    alias nothrow void function(sfWindow* window,const(char)* title) da_sfWindow_setTitle;
    alias nothrow void function(sfWindow* window,uint width,uint height,const(sfUint8)* pixels) da_sfWindow_setIcon;
    alias nothrow void function(sfWindow* window,sfBool visible) da_sfWindow_setVisible;
    alias nothrow void function(sfWindow* window,sfBool visible) da_sfWindow_setMouseCursorVisible;
    alias nothrow void function(sfWindow* window,sfBool enabled) da_sfWindow_setVerticalSyncEnabled;
    alias nothrow void function(sfWindow* window,sfBool enabled) da_sfWindow_setKeyRepeatEnabled;
    alias nothrow sfBool function(sfWindow* window,sfBool active) da_sfWindow_setActive;
    alias nothrow void function(sfWindow* window) da_sfWindow_display;
    alias nothrow void function(sfWindow* window,uint limit) da_sfWindow_setFramerateLimit;
    alias nothrow void function(sfWindow* window,float threshold) da_sfWindow_setJoystickThreshold;
    alias nothrow sfWindowHandle function(const(sfWindow)* window) da_sfWindow_getSystemHandle;
}

__gshared
{
    da_sfContext_create sfContext_create;
    da_sfContext_destroy sfContext_destroy;
    da_sfContext_setActive sfContext_setActive;
    da_sfJoystick_isConnected sfJoystick_isConnected;
    da_sfJoystick_getButtonCount sfJoystick_getButtonCount;
    da_sfJoystick_hasAxis sfJoystick_hasAxis;
    da_sfJoystick_isButtonPressed sfJoystick_isButtonPressed;
    da_sfJoystick_getAxisPosition sfJoystick_getAxisPosition;
    da_sfJoystick_update sfJoystick_update;
    da_sfKeyboard_isKeyPressed sfKeyboard_isKeyPressed;
    da_sfMouse_isButtonPressed sfMouse_isButtonPressed;
    da_sfMouse_getPosition sfMouse_getPosition;
    da_sfMouse_setPosition sfMouse_setPosition;
    da_sfVideoMode_getDesktopMode sfVideoMode_getDesktopMode;
    da_sfVideoMode_getFullscreenModes sfVideoMode_getFullscreenModes;
    da_sfVideoMode_isValid sfVideoMode_isValid;
    da_sfWindow_create sfWindow_create;
    da_sfWindow_createFromHandle sfWindow_createFromHandle;
    da_sfWindow_destroy sfWindow_destroy;
    da_sfWindow_close sfWindow_close;
    da_sfWindow_isOpen sfWindow_isOpen;
    da_sfWindow_getSettings sfWindow_getSettings;
    da_sfWindow_pollEvent sfWindow_pollEvent;
    da_sfWindow_waitEvent sfWindow_waitEvent;
    da_sfWindow_getPosition sfWindow_getPosition;
    da_sfWindow_setPosition sfWindow_setPosition;
    da_sfWindow_getSize sfWindow_getSize;
    da_sfWindow_setSize sfWindow_setSize;
    da_sfWindow_setTitle sfWindow_setTitle;
    da_sfWindow_setIcon sfWindow_setIcon;
    da_sfWindow_setVisible sfWindow_setVisible;
    da_sfWindow_setMouseCursorVisible sfWindow_setMouseCursorVisible;
    da_sfWindow_setVerticalSyncEnabled sfWindow_setVerticalSyncEnabled;
    da_sfWindow_setKeyRepeatEnabled sfWindow_setKeyRepeatEnabled;
    da_sfWindow_setActive sfWindow_setActive;
    da_sfWindow_display sfWindow_display;
    da_sfWindow_setFramerateLimit sfWindow_setFramerateLimit;
    da_sfWindow_setJoystickThreshold sfWindow_setJoystickThreshold;
    da_sfWindow_getSystemHandle sfWindow_getSystemHandle;
}