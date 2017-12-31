# Pre-work - *Tipmoji*

**Tipmoji** is a tip calculator application for iOS.

Submitted by: **Rishi Talati**

Time spent: **11** hours spent in total

## User Stories

The following **required** functionality is complete:

* [complete] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [complete] Settings page to change the default tip percentage.
* [ ] UI animations
* [complete] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [complete] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
1. Implemented slider over standard text-field calculator
2. Implemented slider-dependent image output using if-else statements with a UIImageView. Image corresponds to how poorly/well you tipped.
3. In the settings menu, user can preset the slider value, and percentage will display above as user changes slider value.
4. Added emojis (those were super easy to implement in the text, just use Control-Command-Space and they will pop up).

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src="https://i.imgur.com/iMaU7TE.gif" title="Video Walkthrough" width="600" height="800" alt="Video Walkthrough"/>

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I took a bit of an unconvetional approach with this app, which is why it took so long. I change the classic text field to a slider as stated above, and linked images to the slider by creating thresholds for each float value that the slider hit. The initial walkthrough took me 3 hours to build, while the other 8 hours was spent changing the text fields to slider fields, implementing the features described above, and storing the user input for a fixed amount of time (in our case it is 15 seconds for User Story walkthrough purposes.) The most challenging part was definitely pre-configuring a set time to either save or reset the values based on the timeframe elapsed. Errors I am still experiencing are being able to truncate the amount of decimal places in the total since it's a function of two seperate things, and formating it's currency, in additional to a constraint issue.

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
