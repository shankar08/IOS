//
//  XYZAppDelegate.h
//  MathLearningApp
//
//  Created by Shankar Prajapati on 2/9/14.
//

#import "TableCell.h"

@implementation TableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    @autoreleasepool {
          [super setSelected:selected animated:animated];
    }
  

    // Configure the view for the selected state
}

@end
