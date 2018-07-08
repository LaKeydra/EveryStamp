//
//  AudioStamp.h
//

#import <Foundation/Foundation.h>

//#import "AudioStampCore.h"


@protocol AudioStampDelegate

-(void)audioStampEventDecoded;
-(void)audioStampEventSuccess;
-(void)audioStampEventFail:(int)res;
-(void)audioStampEventSuccessString:(NSDictionary *)data;

@end

@interface AudioStamp : NSObject

- (int)initDecoding:(NSString*)key serverIp:(NSString*)serverIp;
- (int)initDecoding_v2:(NSString*)key serverIp:(NSString*)serverIp deviceUniqueId:(NSString*)deviceUniqueId;

// softzam
- (int)initDecoding_v4:(NSString*)key serverIp:(NSString*)serverIp deviceUniqueId:(NSString*)deviceUniqueId;

- (int)startDecoding; // -1 : not initialized, -2 : already started, -3 : start failed**
- (void)stopDecoding;
- (int) getStampId;
- (int) getCountryId;
- (int) getCrc;
- (int) getProjectId;
- (int) getSeqNo;
- (int) getShopId;
- (bool) getShuffle;
- (bool) isScanning;
- (double) getSignalPWR;
- (double) getPowerThr;
- (void) setSignalLevel:(double) siglevel;
- (void) setPowerThr:(double) siglevel;
- (void) setShuffle:(bool) enable;
- (int) checkPaid:(int)cardId cardName:(NSString*)cardName;
- (NSString*) getVersion;
- (long) getDecodeStartTime;
- (long) getServerConnectionTime;

+ (AudioStamp *)sharedInstance;

@property(nonatomic, assign) id <AudioStampDelegate> delegate;

@end
