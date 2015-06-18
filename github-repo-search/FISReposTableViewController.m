//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"
#import "FISGithubRepository.h"
#import "FISGithubAPIClient.h"

@interface FISReposTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchBBI;
@property (strong, nonatomic) FISReposDataStore *dataStore;
@property (strong, nonatomic) UIAlertController *alertController;
@end

@implementation FISReposTableViewController

- (IBAction)searchTapped:(UIBarButtonItem *)sender {
    
    self.alertController = [UIAlertController alertControllerWithTitle:nil message:@"Search Github Repos" preferredStyle:UIAlertControllerStyleAlert];
                            
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Query";
    }];
    
    UIAlertAction *searchAction = [UIAlertAction actionWithTitle:@"Search" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSString *queryString = ((UITextField *)self.alertController.textFields[0]).text;
        self.dataStore = [FISReposDataStore sharedDataStore];
        [self.dataStore searchRepositoriesWithQuery:queryString Completion:^(BOOL success) {
            if (success) {
                [self.tableView reloadData];
            }
        }];
    }];
    
    [self.alertController dismissViewControllerAnimated:NO completion:nil];
    
    [self.alertController addAction:searchAction];
    
    [self presentViewController:self.alertController animated:NO completion:nil];

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.accessibilityLabel=@"Repo Table View";
    self.tableView.accessibilityIdentifier=@"Repo Table View";

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel=@"Repo Table View";
    self.dataStore = [FISReposDataStore sharedDataStore];
    [self.dataStore getRepositoriesWithCompletion:^(BOOL success) {
        [self.tableView reloadData];
    }];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataStore.repositories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];

    FISGithubRepository *repo = self.dataStore.repositories[indexPath.row];
    cell.textLabel.text = repo.fullName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FISGithubRepository *repo = self.dataStore.repositories[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.dataStore toggleStarForRepo:repo CompletionBlock:^(BOOL starred) {
        if (starred) {
            NSString *message = [NSString stringWithFormat:@"You just starred %@", repo.fullName];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Repo Starred"  message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        } else
        {
            NSString *message = [NSString stringWithFormat:@"You just unstarred %@", repo.fullName];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Repo Unstarred"  message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

@end
