# daijisen

## why
My Japanese professor wanted a web app that could quickly find japanese-to-japanese definitions using Yahoo's daijisen dictionary.

## installation
```
gem install daijisen
```

## usage
Pass some furigana to a new daijisen query object

```
query = Daijisen::Query.new("漢字")
```

You will now have access to a list of readings, examples, and links to specific definitions

```
query.defs[0].link
query.defs[0].reading
query.defs[0].example
```
頑張って