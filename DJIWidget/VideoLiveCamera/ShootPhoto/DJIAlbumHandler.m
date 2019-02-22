//
//  DJIAlbumHandler.m
//
//  Copyright (c) 2017 DJI. All rights reserved.
//

#import "DJIAlbumHandler.h"
#import "DJIWidgetMacros.h"


#define UNKNOWN_ERROR_CODE (-11)


@implementation DJIAlbumHandler

+ (void)savePhotoToAssetLibrary:(NSURL *)url completionBlock:(DJIAlbumCompletionBlock)completion
{
	__block NSString *assertID = nil;
	[[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
		PHAssetChangeRequest* request = [PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:url];
		assertID = request.placeholderForCreatedAsset.localIdentifier;
	} completionHandler:^(BOOL success, NSError * _Nullable error) {
		if (error || !success) {
			if (completion) {
				completion(error);
			}
			return;
		}
		
		PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsWithLocalIdentifiers:@[assertID] options:nil];
		[self addAssetToDJEyeAlbum:assets withCompletionBlock:completion];
	}];
}

+ (void)addAssetToDJEyeAlbum:(PHFetchResult<PHAsset *> *)assets withCompletionBlock:(DJIAlbumCompletionBlock)completion
{
	PHAssetCollection* collection = [self findOrCreateAssetsCollectionWithGroupName:@"DJIWidget Import"];
	if (!collection) {
		NSError *error = [NSError errorWithDomain:@"com.dji.widget" code:UNKNOWN_ERROR_CODE userInfo:nil];
		if (completion) {
			completion(error);
		}
		return;
	}
	
	[[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
		PHAssetCollectionChangeRequest *collectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
		[collectionChangeRequest insertAssets:assets atIndexes:[NSIndexSet indexSetWithIndex:0]];
	} completionHandler:^(BOOL success, NSError * _Nullable error) {
		if (error) {
			if (completion) {
				completion(error);
			}
			return;
		}
		if (completion) {
			completion(nil);
		}
	}];
}


+ (PHAssetCollection *)findOrCreateAssetsCollectionWithGroupName:(NSString*)group
{
	PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
	for (PHAssetCollection *collection in collections) {
		if ([collection.localizedTitle isEqualToString:group]) {
			return collection;
		}
	}
	
	NSError *error = nil;
	__block NSString *createID = nil;
	[[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
		PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:group];
		createID = request.placeholderForCreatedAssetCollection.localIdentifier;
	} error:&error];
	
	if (error) {
		return nil;
	}else{
		return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[createID] options:nil].firstObject;
	}
	
}

@end
