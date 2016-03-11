

# Github-Repo-Search

## Personal Access Tokens

Most of the API interaction we've been doing so far has been authorized using client IDs and secrets, which lets API calls act on behalf of an **application**. For this lab, though, we're going to be searching, starring and unstarring Github repositories, which only makes sense if done on behalf of a **user**. In a few days, we'll see how to do this with OAuth. But for now, we're going to use a *personal access token* from Github's website.

In the settings section of Github's website, go to "Personal access tokens" and then "Generate new token". Give the token some name (say, "FIS Labs" or something). You then need to specify the permissions you grant someone with this token. For this lab, granting just `public_repo` should be sufficient.

Once you click "Generate token", you'll see your personal access token one time and one time only. Be sure to copy it before leaving the page. We're going to store it in a file in our project.


## The Constants File

Bring over the Constants File from the github-starring lab. Below is what your **FISConstants.m** should look like:

```objc
NSString *const GITHUB_CLIENT_ID = @"your app ID";
NSString *const GITHUB_CLIENT_SECRET = @"your app secret";
NSString *const GITHUB_AUTH_TOKEN = @"your personal access token";
```


## Goal

We want to be able to let users search all of the github repos and have it display the search result (the repo name) in the tableView. The user will tap a `UIBarButtonItem` that displays a `UIAlertController` asking what the user wants to search for. Implement the necessary methods utilizing AFNetworking. As well, make this current lab be able to star/unstar the repos similiar to how you did it with the Github-Starring lab. But, instead of using NSURLSession, implement those methods using AFNetworking.
 

## Instructions

  1. Bring over your code from github-repo-starring (copying the necessary files over to your new project folder.. `FISGithubAPIClient.h`, `FISGithubAPIClient.m`, the data store files, constants files, etc.). After copying over the files you want to use, drag/drop them into Xcode.
  2.  Make a method in `FISGithubAPIClient` that searches a repo given its full name. Take a look at the [repo search documentation](https://developer.github.com/v3/search/#search-repositories) and implement the appropriate method to do a search for repositories.
  3. Add a `UIBarButtonItem` to your TableViewController in Storyboard. When a user taps the button, it should display a `UIAlertController` that asks what the user would like to search for. When they select Search perform the search (utilizing the method you had written in Instruction#2) and then display the updated list of repos. `UIAlertController` is new in iOS 8. [This](http://useyourloaf.com/blog/2014/09/05/uialertcontroller-changes-in-ios-8.html) is my favorite resource on it.
  4. Re-implement the star/unstar methods using AFNetworking instead of NSURLSession. If you didn't complete the Github-Starring lab, reference those instructions implementing the methods using AFNetworking.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/github-repo-search' title='github-repo-search'>github-repo-search</a> on Learn.co and start learning to code for free.</p>
