# Petro

Work in Progress. User Beware.

Reads in a hash and uses that to create rails commands that can be ran to generate code.

## Usage

```
group :development do
  gem 'petro', github: 'revans/petro'
end
```

Look at the test/assets/feature.yml file to get an idea of the structure. It's a yaml file that is
generated into a hash before it's passed to petro to generate the rails commands.
