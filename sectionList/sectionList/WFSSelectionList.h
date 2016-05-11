//
//  WFSSelectionList.h
//  sectionList
//
//  Created by smc on 16/2/23.
//  Copyright © 2016年 smc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^wfsBtnClicked)(UIButton *btn);//
@interface WFSSelectionList : UIScrollView
- (instancetype)initWithFrame:(CGRect)frame selectedBtn:(wfsBtnClicked)clickedBtn;
@end
