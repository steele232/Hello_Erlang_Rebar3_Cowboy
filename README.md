# Hello_Erlang_Rebar3_Cowboy

## Your first running Erlang Project!

This project is meant to be your first Erlang hello world server.

Erlang is notoriously hard to get started with, so this project aims to alleviate some of the pain points of getting your very first project running.

If you have ANY problem, leave an issue on this project with some information about what error messages you are seeing.

## Introductory Erlang Materials

- Learn rebar3. Follow [this tutorial](https://medium.com/erlang-central/building-your-first-erlang-app-using-rebar3-25f40b109aad) instead of reading the rest of my README haha.
- Read (over the next month or two) [Learn You Some Erlang](https://learnyousomeerlang.com/content). It's the best free book I know about Erlang and it's written by Fred Herbert. 
- [Another good site](https://erlangbyexample.org/) for learning Erlang
- Try running some commands online without needing to install Erlang [Link](http://tryerl.seriyps.ru/)
- Try a little more friendly version of the Erlang docs [Link](https://erldocs.com/)
- The official Erlang docs are [here](https://erlang.org/doc/)
- Here is an overview from Fred Herbert on some of the merits and realities of Erlang [Link](https://ferd.ca/an-open-letter-to-the-erlang-beginner-or-onlooker.html)

## Running this Project

### Installing Erlang and dependencies for this project

- Install Erlang; Get your download from [Erlang Solutions](https://www.erlang-solutions.com/resources/download.html) instead of Erlang.org
- Install Rebar3; Download the Erlang executable from the homepage of [rebar3.org](https://www.rebar3.org/). The First link (above about rebar3) explains this in a little more detail.
- You may need to add the erlang and rebar3 binaries to your path. If you're coming from another programming language, hopefully you will know how to do this; otherwise, I hope the Erlang installer you chose did it for you.

### Commands to run

- Git clone this repo `git clone https://github.com/steele232/Hello_Erlang_Rebar3_Cowboy.git` or download it as a Zip file from [Github.com](https://github.com/steele232/Hello_Erlang_Rebar3_Cowboy.git)
- The rest of these commands are pretty much from [this tutorial](https://www.erlang-solutions.com/resources/download.html)
- Get into your command line program. On Mac/Linux, it's called "Terminal" and on Windows it's called "Command Prompt".
- Navigate to the project directory with the `cd` command
- Start an Erlang shell by running `rebar3 shell` in your command line
- That last command will have started the application, so you can visit `localhost:8080` in your web browser and you will see "Hello Hawking Instamo" which just shows that the server is up and running.
- In the Erlang shell, run `application:stop(cowboy_rebar3).` to stop the application. cowboy_rebar3 is the name of the application. When you create your own project with rebar3, you will substitute cowboy_rebar3 with the name of your own project.
- In the Erlang shell, run `application:start(cowboy_rebar3).` to start the application. 

### TODO How to use rebar3 to create another application and run it


## Attributions

- Clone of https://github.com/npkhoa2197/cowboy_rebar3 but updated to remove a missing dependency.
- Inspired by: https://github.com/dronowar/erlang_rest_api
