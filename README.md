# Github-Repo-Search

## Demo

<iframe width="560" height="315" src="https://www.youtube.com/embed/08vCCBNpQi0?rel=0&modestbranding=1" frameborder="0" allowfullscreen></iframe><p><a href="https://www.youtube.com/watch?v=08vCCBNpQi0">GitHub Search Demo</a></p>

## Personal Access Tokens

Most of the API interaction we've been doing so far has been authorized using client IDs and secrets, which lets API calls act on behalf of an **application**. For this lab, though, we're going to be searching, starring and unstarring Github repositories, which only makes sense if done on behalf of a **user**. In a few days, we'll see how to do this with OAuth. But for now, we're going to use a ​*personal access token*​ from Github's website.

In the settings section of Github's website, go to "Personal access tokens" and then "Generate new token". Give the token some name (say, "FIS Labs" or something). You then need to specify the permissions you grant someone with this token. For this lab, granting just `public_repo` should be sufficient.

Once you click "Generate token", you'll see your personal access token one time and one time only. Be sure to copy it before leaving the page. We're going to store it in a file in our project.

## Goal

The goal is to search for repositories on github and display the results in your tableview. The user will tap a `UIBarButtonItem` such as `Search` to display a `UIAlertController` containing a `UITextField` prompting the user to enter a query. The controller should also include a `UIAlertAction` to initiate the search. After the search is complete, the alert controller should be dismissed and the tableview should be reloaded with the search results. Use AFNetworking instead of NSURLSession to make your network calls.

## API Calls


###### 1. Declare a variable to hold a URL string connecting us to Github (use appropriate path and access token)
```
NSString *githubURL = [NSString stringWithFormat:<githubURL>];
```
###### 2. Declare a variable to hold a AFHTTPSessionManager object
```
AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
```
###### 3. Use appropriate HTTP verb method in your request
```
// GET data
[manager GET:githubURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    completionBlock();
} failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"Fail: %@",error.localizedDescription);
}];

// PUT data
[manager PUT:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    completionBlock();
} failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"FAIL:%@",error.localizedDescription);
}];

// DELETE data
[manager DELETE:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    completionBlock();
} failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"FAIL:%@",error.localizedDescription);
}];
```

## Instructions

1. Bring over your code from the github-repo-starring lab. After dragging over your files, make sure you reestablish any connections needed in your project file. You will need:

  * Constants.h/m

  * GithubAPIClient.h/m

  * DataStore.h/m

  * TableViewController.h/m

  * &lt;your_storyboard&gt;.storyboard (you may need to recreate your storyboard instead of dragging it over)

2. Write a method in `FISGithubAPIClient` that searches a repo from the text provided in the alert controller (which you will create). Take a look at the [repo search documentation](https://developer.github.com/v3/search/#search-repositories) and implement the appropriate method to do a search for repositories.

3. Add a `UIBarButtonItem` such as `Search` to your TableViewController in Storyboard. When a user taps the button, it should display a `UIAlertController` that prompts the user to enter a search query. Add a `UIAlertAction` to initiate the search. [This](http://useyourloaf.com/blog/2014/09/05/uialertcontroller-changes-in-ios-8.html) is my favorite resource on `UIAlertController`.

4. Re-implement the star/unstar methods using AFNetworking instead of NSURLSession. If you didn't complete the Github-Starring lab, reference those instructions implementing the methods using AFNetworking.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/github-repo-search' title='github-repo-search'>github-repo-search</a> on Learn.co and start learning to code for free.</p>

