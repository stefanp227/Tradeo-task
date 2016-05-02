## README
Tradeo-task
===========


This task was given to me as an interview task. It's a simple Rails API that allows you to create notes with tags.
You can also search with a given a note title, or a note content or a tag name.

How to use:
  When you have the project running(I will use localhost:3000 for the examples) simply do a curl query.

  For listing all notes:
    `curl -X GET http://localhost:3000/notes`

  For listing a certain note:
    `curl -X GET http://localhost:3000/notes/:id` 

  For listing all the tags on a certain note:
    `curl -X GET http://localhost:3000/notes/:id/tags`

  For searching by a note title:
    `curl -X get http://localhost:3000/search/title/:title`

  For searching by a note content:
    `curl -X get http://localhost:3000/search/content/:content`

  For searching by a tag name:
    `curl -X get http://localhost:3000/search/tag/:tag`