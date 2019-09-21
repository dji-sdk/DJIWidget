# DJIWidget

## What Is This?

The DJIWidget is a delightful DJI library includes VideoPreviewer for video decoding. You can integrate the contents of DJIWidget into your DJI iOS Mobile SDK project to implement the video decoding feature. DJIWidget also provides other features like No SD Card shoot photo and recode video.

For more details of the usage, please check the [DJI Mobile SDK iOS](https://github.com/dji-sdk/Mobile-SDK-iOS) Github Repo.

## Installation

DJIWidget is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'DJIWidget', '~> 1.6.1'
```

> Note: Remember to add `use_frameworks!` in the pod file to use DJIWidget as a dynamic framework in Swift project.
> 

## FFmpeg Customization

We have forked the original FFmpeg and added customized features to provide more video frame information including the frame's width and height, frame rate number, etc. These features will help to implement video hardware decoding. 

The DJIWidget is dynamically linked with unmodified libraries of <a href=http://ffmpeg.org>FFmpeg</a> licensed under the <a href=http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html>LGPLv2.1</a>. The source code of these FFmpeg libraries, the compilation instructions, and the LGPL v2.1 license are provided in [Github](https://github.com/dji-sdk/FFmpeg).

## Credits

DJIWidget is owned and maintained by [DJI SDK](https://developer.dji.com).

## Support

You can get support from DJI with the following methods:

- Post questions in [**Stackoverflow**](http://stackoverflow.com) using [**dji-sdk**](http://stackoverflow.com/questions/tagged/dji-sdk) tag
- dev@dji.com

## License

DJIWidget is available under the MIT license. See the LICENSE file for more info.
