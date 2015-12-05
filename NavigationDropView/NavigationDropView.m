//
//  NavigationDropView.m
//  NavigationDropView
//
//  Created by YCLZONE on 12/5/15.
//  Copyright © 2015 YCLZONE. All rights reserved.
//

#import "NavigationDropView.h"

@interface NavigationDropView ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


/** 选中回调 */
@property (nonatomic, copy) SelectionDoneHandler doneHandler;
/** 选中序号 */
@property (nonatomic, assign) NSInteger indexSelected;
@end

@implementation NavigationDropView

- (void)awakeFromNib {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSString *className = NSStringFromClass([UITableViewCell class]);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:className];
}

#pragma mark - Public Methods
+ (instancetype)dropView {
    NavigationDropView *dropView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NavigationDropView class]) owner:nil options:nil].firstObject;
    return dropView;
}

+ (instancetype)showFromView:(UIView *)view
                       items:(NSArray<NSString *> *)items
               initSelection:(NSInteger)selection
                 doneHandler:(SelectionDoneHandler)done {
    NavigationDropView *dropView = [self dropView];
    dropView.indexSelected = selection;
    dropView.items = items;
    dropView.doneHandler = done;
    
    [view addSubview:dropView];
    
    return dropView;

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row];
    if (indexPath.row == self.indexSelected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.indexSelected = indexPath.row;
    
    if (self.doneHandler) {
        self.doneHandler(self.indexSelected);
    }
}

#pragma mark - Getter && Setter
- (NSArray<NSString *> *)items {
    if (!_items) {
        _items = @[];
    }
    return _items;
}

@end
