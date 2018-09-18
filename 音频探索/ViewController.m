//
//  ViewController.m
//  音频探索
//
//  Created by 刘亚合 on 2018/9/18.
//  Copyright © 2018年 刘亚合. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
{
    IBOutlet UILabel * soundNumLabel;
}
@end

static SystemSoundID soundID = 1022;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //2.播放特定的声音
    //系统声音
//        NSString * path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",@"sms-sms-received4",@"caf"];
//        NSURL * url = [NSURL fileURLWithPath:path];
    //加载音效的URL
//    NSURL * url = [[NSBundle mainBundle] URLForResource:@"test4.m4a" withExtension:nil];
    
//    if (url) {
        //将音效的URL桥接为CFURLRef类型的URL
//        CFURLRef urlRef = (__bridge CFURLRef)(url);
        
        //根据音效url生成对应的SystemSoundID(传soundID的地址，生成之后会根据地址找到它，并赋值)
//        AudioServicesCreateSystemSoundID(urlRef, &soundID);
//    }
    //3.循环震动
//    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    AudioServicesPlaySystemSound(soundID);
}
- (void)otherTestCode{
    //1.播放震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
//    [self performSelector:@selector(stopPlaySound) withObject:nil afterDelay:2];
}

void systemAudioCallback (){
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
void soundCompleteCallback(SystemSoundID sound,void * clientData) {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  //震动
    AudioServicesPlaySystemSound(soundID);  // 播放系统声音 这里的sound是我自定义的，不要 copy 哈，没有的
}

- (void)stopPlaySound{
    //停止震动
    AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
    AudioServicesRemoveSystemSoundCompletion(soundID);
    AudioServicesDisposeSystemSoundID(kSystemSoundID_Vibrate);
    AudioServicesDisposeSystemSoundID(soundID);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addOrReduce:(UIButton *)sender{
    int num = soundNumLabel.text.intValue;
    if (sender.tag == 1) {
        num++;
    }else{
        num--;
    }
    soundNumLabel.text = [@(num) stringValue];
    soundID = num;
    AudioServicesPlaySystemSound(soundID);
}

@end
