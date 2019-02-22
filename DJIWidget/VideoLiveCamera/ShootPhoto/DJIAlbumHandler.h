//
//  DJIAlbumHandler.h
//
//  Copyright (c) 2017 DJI. All rights reserved.
//
#import <AssetsLibrary/AssetsLibrary.h>
#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

typedef void (^DJIAlbumCompletionBlock)(NSError * _Nullable error);

@interface DJIAlbumHandler : NSObject

+ (void) savePhotoToAssetLibrary:(NSURL *)url completionBlock:(DJIAlbumCompletionBlock)completion;

@end
