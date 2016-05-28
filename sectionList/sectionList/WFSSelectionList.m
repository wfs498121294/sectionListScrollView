//
//  WFSSelectionList.m
//  sectionList
//
//  Created by smc on 16/2/23.
//  Copyright © 2016年 smc. All rights reserved.
//

#import "WFSSelectionList.h"
@interface WFSSelectionList()
{
    NSArray *_sectionLists;//有多少个btn
    CGFloat _btnHeight;//btn 的高度
    CGFloat _btnSpace;//btn的间距
    CGFloat _btnOffsetY;//btn的左顶点Y
    CGFloat _btnSubImageHeight;//底部图片的高度
    NSMutableArray *_sectionFrameArray;//每个btn的大小
    CGFloat _btnTitleFont;//btn 字体大小
    UIColor *_titleColor;//btn 字体颜色
    NSInteger _lastSelectedIndex;//上一个选中的btn下标
}
@property (nonatomic,copy)wfsBtnClicked clickedBtn;
@end
@implementation WFSSelectionList

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        _sectionLists = [NSArray arrayWithObjects:@"推荐",@"直播",@"FM",@"电视剧",@"影视",@"动漫",@"电视剧",@"电影",@"综艺节目",@"其他",nil];
//        _sectionFrameArray = [NSMutableArray array];
//        _btnTitleFont = 11.0;
//        _lastSelectedIndex = 10;
//        _btnHeight = 28.0;
//        _btnSpace = 10.0;
//        _btnOffsetY = 5.0;
//        _btnSubImageHeight= 5.0;
//        _titleColor = [UIColor blackColor];
//        self.delaysContentTouches = NO;
//        self.showsHorizontalScrollIndicator = NO;
//        self.showsVerticalScrollIndicator = NO;
//        [self getFrameFromData];
//        [self addBtns];
//    }
//
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame selectedBtn:(wfsBtnClicked)clickedBtn
{
    self = [self initWithFrame:frame];
    if (self) {
        self.clickedBtn = clickedBtn;
        
        _sectionLists = [NSArray arrayWithObjects:@"推荐",@"直播",@"FM",@"电视剧",@"影视",@"动漫",@"电视剧",@"电影",@"综艺节目",@"其他",nil];
        _sectionFrameArray = [NSMutableArray array];
        _btnTitleFont = 11.0;
        _lastSelectedIndex = 10;
        _btnHeight = 28.0;
        _btnSpace = 10.0;
        _btnOffsetY = 5.0;
        _btnSubImageHeight= 5.0;
        _titleColor = [UIColor blackColor];
        self.delaysContentTouches = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        [self getFrameFromData];
        [self addBtns];

    }
    return self;
}


- (void)addBtns
{
    for (int i =0; i<[_sectionLists count];i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_sectionLists[i] forState:0];
        CGFloat totalWidth = 0.0;
        for (int j =0; j<i;j++)
        {
            NSNumber * width = _sectionFrameArray[j];
           totalWidth+=[width floatValue];
        }
       
         btn.frame = CGRectMake(totalWidth+_btnSpace*i, _btnOffsetY, [_sectionFrameArray[i] floatValue], _btnHeight);
        [btn setTitleColor:_titleColor forState:0];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:_btnTitleFont]];
//        [btn setBackgroundColor:[UIColor blueColor]];
        
        UIImageView *subImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"choose"]];
        [subImage setFrame:CGRectMake(totalWidth+_btnSpace*i, _btnHeight+_btnOffsetY, [_sectionFrameArray[i] floatValue],_btnSubImageHeight)];
        [self addSubview:subImage];
        [self addSubview:btn];
        //默认选中第一个
        if (i==0)
        {
            btn.selected = YES;
        }
        btn.tag =i+10;//btn的tag
        subImage.tag = i+50;//下划线tag
        subImage.hidden = !btn.selected;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

// 通过内容得到每个内容的 frame
- (void)getFrameFromData
{
    for (NSString *str in _sectionLists)
    {
     CGRect strFrame = [str boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_btnTitleFont]} context:nil];
     [_sectionFrameArray addObject:[NSNumber numberWithFloat:strFrame.size.width+20]];
    }

}

- (void)btnClicked:(UIButton *)sender
{
    if (sender.tag!=_lastSelectedIndex)//判断是否单击的是 选中项
    {
        sender.selected = !sender.selected;
        UIImageView *image = [self viewWithTag:_lastSelectedIndex+40];
        image.hidden = YES;
    }
    
    if (sender.selected)
    {
        if (sender.tag!=_lastSelectedIndex)
        {
            UIButton *btn = [self viewWithTag:_lastSelectedIndex];
            UIImageView *image = [self viewWithTag:sender.tag+40];
            image.hidden = NO;
            btn.selected = NO;
            _lastSelectedIndex = sender.tag;
        }
        //选中后执行的操作
        if (self.clickedBtn)
        {
            self.clickedBtn(sender);
        }
        //判断是否点击屏幕边缘的btn btn移动情况分析
        CGFloat offset;
        if (sender.tag>10)
        {
              offset = [_sectionFrameArray[sender.tag-10] floatValue]+[_sectionFrameArray[sender.tag-11] floatValue]+20;
        }
        else{
            offset = 0;
        }
        //考虑最后两个btn的情况
        CGRect visible;
        if ((sender.tag-10==_sectionLists.count-1-1)||(sender.tag-10==_sectionLists.count-1))
        {
             visible = [(UIView *)[self viewWithTag:_sectionLists.count-1+10] frame];
        }
        else{
            visible = [(UIView *)[self viewWithTag:sender.tag+2] frame];

        }
      //分 最左边 还有右边的情况
        if (CGRectGetMaxX(visible)>self.frame.size.width)
        {
              [self setContentOffset:CGPointMake(-self.frame.size.width+CGRectGetMaxX(visible), 0) animated:YES];
        }
        else
        {
         [self setContentOffset:CGPointZero animated:YES];
        }
    }
    
    
}

//处理无法滚动的情况
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    UITouch *touch = [touches anyObject];
    if(touch.phase == UITouchPhaseMoved)
    {
        return NO;
    }
    else
    {
        return [super touchesShouldBegin:touches withEvent:event inContentView:view];
    }
}


- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:UIButton.class]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}
@end
