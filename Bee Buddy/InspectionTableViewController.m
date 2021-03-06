//
//  InspectionTableViewController.m
//  Bee Buddy
//
//  Created by Eric Newman on 5/19/15.
//  Copyright (c) 2015 Eric Newman. All rights reserved.
//

#import "InspectionTableViewController.h"

@interface InspectionTableViewController ()

@property (nonatomic, strong) NSArray *inspectionItems;


@end

@implementation InspectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.inspectionItems = @[@"Queen", @"Eggs", @"Open Brood", @"Capped Brood", @"Capped Honey"];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView reloadData];
    if (indexPath.row <5) {
        UITableViewCell *cell=(UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        if (cell.backgroundColor != [UIColor greenColor]) {
            [cell setBackgroundColor:[UIColor greenColor]];
        }else{
            [cell setBackgroundColor:[UIColor whiteColor]];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.inspectionItems.count + 3;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row < 5) {
        UITableViewCell *basicCell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
        basicCell.textLabel.text = self.inspectionItems[indexPath.row];
        return basicCell;
    }
    else if (indexPath.row == 5){
        UITableViewCell *notesCell = [tableView dequeueReusableCellWithIdentifier:@"notesCell"];
        notesCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return notesCell;
    }else if (indexPath.row == 6){
        UITableViewCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        return imageCell;
    }else{
        UITableViewCell *deleteCell = [tableView dequeueReusableCellWithIdentifier:@"deleteCell"];
        return deleteCell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 6) {
        return [UIImage imageNamed:@"queen"].size.height + 20.0;
    } else {
        return 44;
    }
}
- (IBAction)saveButton:(id)sender {
}

- (IBAction)cancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addImage:(id)sender {
    NSLog(@"I worked!");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
