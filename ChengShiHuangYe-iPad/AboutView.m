//
//  AboutView.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/10/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "AboutView.h"

@interface AboutView()

@property (weak, nonatomic) IBOutlet UIImageView *about1;
@property (weak, nonatomic) IBOutlet UIImageView *about2;
@property (weak, nonatomic) IBOutlet UIButton *joinUsButton;
@property (weak, nonatomic) IBOutlet UIButton *contactUsButton;
@property (weak, nonatomic) IBOutlet UIImageView *aboutFooter;

@property (weak, nonatomic) IBOutlet UIButton *aboutBack;
@property (weak, nonatomic) IBOutlet UIView *contactView;

@end

@implementation AboutView

+(AboutView*) createInController:(UIViewController*)controller
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AboutLayer" owner:controller options:nil] firstObject];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) hideAll
{
    self.about1.alpha=0;
    self.about2.alpha=0;
    self.contactView.alpha=0;
    self.joinUsButton.alpha=0;
    self.contactUsButton.alpha=0;
    self.aboutBack.alpha=0;
    self.aboutFooter.frame=CGRectMake(self.aboutFooter.frame.origin.x, self.frame.size.height, self.aboutFooter.frame.size.width, self.aboutFooter.frame.size.height);
}


#pragma mark - contact view

static float contactAnimationDuration=0.5;
- (IBAction)contactButtonClick:(UIButton *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:contactAnimationDuration];
    self.about2.alpha=0;
    self.joinUsButton.alpha=0;
    self.contactView.alpha=1;
    [UIView commitAnimations];
}

- (IBAction)contactBackButtonClick:(UIButton *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:contactAnimationDuration];
    self.about2.alpha=1;
    self.joinUsButton.alpha=1;
    self.contactView.alpha=0;
    [UIView commitAnimations];
}

#pragma mark - join 

- (IBAction)joinButtonClick:(id)sender
{
    NSURL* url=[[NSURL alloc] initWithString:@"http://shop65369929.taobao.com/"];
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - start show

static float animationDuration=0.8;
-(void) showAbout1
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.about1.alpha=1;
     }completion:^(BOOL finish){
         if (finish) [self showAbout2];
     }];
}

-(void) showAbout2
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.about2.alpha=1;
     }completion:^(BOOL finish){
         if (finish) [self showJoinUs];
     }];
}

-(void) showJoinUs
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.joinUsButton.alpha=1;
     }completion:^(BOOL finish){
         if (finish) [self showContactUs];
     }];
}

-(void) showContactUs
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.contactUsButton.alpha=1;
     }completion:^(BOOL finish){
         if (finish) [self showBackButton];
     }];
}

-(void) showBackButton
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.aboutBack.alpha=1;
     }completion:^(BOOL finish){
         if (finish) [self showFooter];
     }];
}

-(void) showFooter
{
    [UIView animateWithDuration:animationDuration animations:^(void)
     {
         self.aboutFooter.frame=CGRectMake(self.aboutFooter.frame.origin.x, self.frame.size.height-self.aboutFooter.frame.size.height, self.aboutFooter.frame.size.width, self.aboutFooter.frame.size.height);
     }completion:^(BOOL finish){
     }];

}

#pragma mark - show

-(void) show
{
    [UIView animateWithDuration:animationDuration*2 animations:^(void){
         self.frame=CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
     }completion:^(BOOL finish){
         if (finish) [self showAbout1];
     }];
}

#pragma mark - leave

- (IBAction)aboutBackButtonClick:(id)sender {
    [self leave];
}

-(void) leave
{
    [UIView animateWithDuration:animationDuration*2 animations:^(void){
        self.frame=CGRectMake(-self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finish){
        [self hideAll];
        if (finish) [self.delegate aboutLeaveDone];
    }];
}

@end
