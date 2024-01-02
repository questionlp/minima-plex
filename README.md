# minima-plex

minima-plex is a fork of the the Jekyll theme, [Minima](https://github.com/jekyll/minima) (originally developed by Parker Moore and the minima contributors).

![minima-plex Theme Preview](/screenshot.png)

## Installation

Add this line to your Jekyll site's Gemfile:

```ruby
gem "minima-plex", git: "https://github.com/questionlp/minima-plex.git"
```

And then execute:

```bash
bundle
```

## Contents At-A-Glance

minima-plex is a fork of the Minima theme at version 2.5.1 that changes the default font families to use the IBM Plex family of fonts. Please refer to the Minima theme's [README.md](https://github.com/jekyll/minima/blob/v2.5.1/README.md) for an overview of the features and configuration of the theme.

minima-plex also adds category and tag pages and a listing of tags at the end of each post. After adding the theme to your Jekyll site, you will need to create the `category` and `tag` directories at the root of your site directory and copy over the `index.html` file from both directories in the theme to the corresponding directories created within your site directory.

Each category and tag that you use in your pages/posts will need corresponding Markdown files named after the category or tag. For individual category Markdown files, use the following template:

```
---
layout: category-page
category: styles
---
```

For individual tag Markdown files, use the following template:

```
---
layout: tag-page
tag: styles
---
```

Do note that any references to `minima` in any configuration files will need to be replaced with `minima-plex`.

The rest of this document covers features modified for this theme.

### Sass

Refers to `.scss` files within the `_sass` directory that define the theme's styles.

- `minima-plex/skins/classic.scss` &mdash; The "classic" skin of the theme. *Used by default.*
- `minima-plex/initialize.scss` &mdash; A component that defines the theme's *skin-agnostic* variable defaults and sass partials. It imports the following components (in the following order):
  - `minima-plex/custom-variables.scss` &mdash; A hook that allows overriding variable defaults and mixins. (*Note: Cannot override styles*)
  - `minima-plex/_base.scss` &mdash; Sass partial for resets and defines base styles for various HTML elements.
  - `minima-plex/_layout.scss` &mdash; Sass partial that defines the visual style for various layouts.
  - `minima-plex/custom-styles.scss` &mdash; A hook that allows overriding styles defined above. (*Note: Cannot override variables*)

Refer the [skins](#skins) section for more details.

## Usage

Have the following line in your config file:

```yaml
theme: minima-plex
```

### Customizing templates

To override the default structure and style of minima-plex, simply create the concerned directory at the root of your site, copy the file you wish to customize to that directory, and then edit the file. e.g., to override the [`_includes/head.html`](_includes/head.html) file to specify a custom style path, create an `_includes` directory, copy `_includes/head.html` from minima gem folder to `<yoursite>/_includes` and start editing that file.

The site's default CSS has now moved to a new place within the gem itself, [`assets/css/style.scss`](assets/css/style.scss).

In minima-plex, if you only need to customize the colors of the theme, refer to the subsequent section on skins. To have your *CSS overrides* in sync with upstream changes released in future versions, you can collect all your overrides for the Sass variables and mixins inside a sass file placed at `_sass/minima-plex/custom-variables.scss` and all other overrides inside a Sass file placed at path `_sass/minima-plex/custom-styles.scss`.

You need not maintain entire partial(s) at the site's source just to override a few styles. However, your stylesheet's primary source (`assets/css/style.scss`) should contain the following:

- Front matter dashes at the very beginning (can be empty).
- Directive to import a skin.
- Directive to import the base styles (automatically loads overrides when available).

Therefore, your `assets/css/style.scss` should contain the following at minimum:

```sass
---
---

@import
  "minima/skins/{{ site.minima-plex.skin | default: 'classic' }}",
  "minima/initialize";
```

#### Skins

minima-plex supports defining and switching between multiple color-palettes (or *skins*).

A skin is a Sass file placed in the directory `_sass/minima-plex/skins` and it defines the variable defaults related to the "color" aspect of the theme. It also embeds the Sass rules related to syntax-highlighting since that is primarily related to color and has to be adjusted in harmony with the current skin.

The default color palette for Minima is defined within `_sass/minima-plex/skins/classic.scss`. To switch to another available skin, simply declare it in the site's config file. For example, to activate `_sass/minima-plex/skins/dark.scss` as the skin, the setting would be:

```yaml
minima-plex:
  skin: dark
```

##### Available skins

Skin setting    | Description
--------------- | -----------
classic         | Default, light color scheme
classic-serif   | Light color scheme, using IBM Plex Serif
dark            | Dark variant of the classic skin
dark-serif      | Dark variant of the classic skin, using IBM Plex Serif
auto            | *Adaptive skin* based on the default classic and dark skins
auto-serif      | *Adaptive skin* based on the default classic and dark skins, using IBM Plex Serif
solarized       | *Adaptive skin* for [solarized](https://github.com/solarized) color scheme skins
solarized-serif | *Adaptive skin* for [solarized](https://github.com/solarized) color scheme skins, using IBM Plex Serif
solarized-light | Light variant of solarized color scheme
solarized-light-serif | Light variant of solarized color scheme, using IBM Plex Serif
solarized-dark  | Dark variant of solarized color scheme
solarized-dark  | Dark variant of solarized color scheme, using IBM Plex Serif

*:bulb: Adaptive skins switch between the "light" and "dark" variants based on the user's operating system setting or browser setting (via CSS Media Query [prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)).*

### Social networks

You can add links to the accounts you have on other sites, with respective icon as an SVG graphic, via the config file. The social media data is sourced from config key `minima-plex.social_links`. It is a list of key-value pairs, each entry corresponding to a link rendered in the footer. For example, to render links to Jekyll GitHub repository and twitter account, one should have:

```yaml
minima-plex:
  social_links:
    - { platform: github,  user_url: "https://github.com/jekyll/jekyll" }
    - { platform: twitter, user_url: "https://twitter.com/jekyllrb" }
```

Apart from the necessary keys illustrated above, `title` may also be defined to render a custom link-title. By default, the title is the same as `platform`. The `platform` key corresponds to the SVG id of the sprite in the composite file at URL `/assets/minima-social-icons.svg`.

The theme ships with an icon for `rss` and icons of select social-media platforms:

- `mastodon`
- `devto`
- `dribbble`
- `facebook`
- `flickr`
- `github`
- `google_scholar`
- `instagram`
- `keybase`
- `linkedin`
- `microdotblog`
- `pinterest`
- `stackoverflow`
- `telegram`
- `twitter`
- `youtube`

To render a link to a platform not listed above, one should first create a file at path `_includes/social-icons/<PLATFORM>.svg` comprised of graphic markup **without the top-level `<svg></svg>`**. The icon is expected to be centered within a viewbox of `"0 0 16 16"`. Then, make an entry under key `minima.social_links`.

For example, to render a link to an account of user `john.doe` at platform `deviantart.com`, the steps to follow would be:

- Get DeviantArt logo in SVG format.
- Using a text-editor, open the downloaded file to inspect if the `viewBox` attribute is defined on the `<svg>` element and is set as `"0 0 16 16" (or similar "square" dimension)`.
- If the `viewBox` attribute is non-square or undefined, the graphic *may optionally need* to be edited in a vector graphic editor such as *Inkscape* or *Adobe Illustrator* for properly aligned render on page.
- Edit the SVG file in text-editor to delete everything **except** what is contained between `<svg></svg>` and save it into the Jekyll project at path `_includes/social-icons/deviantart.svg`.
- Finally, edit the Jekyll config file to enable loading of new icon graphic with:

    ```yaml
    minima-plex:
      social_links:
        - platform: deviantart  # same as SVG filename.
          user_url: "https://www.deviantart.com/john.doe"  # URL of profile page.
          title:  My profile at DeviantArt.com  # Optional. Text displayed on hovering over link.
    ```

**Notes:**

- The list of social-links is declarative. List-items are rendered in the order declared in the downstream configuration file and not merged with entries from upstream config file(s) such as theme-config-file or prior local config files.
- The `user_url` is rendered as given without handling any special characters within.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/questionlp/minima-plex>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to version 2.1 of the [Contributor Covenant](http://contributor-covenant.org) code of conduct. A copy of the [code of conduct](CODE_OF_CONDUCT.md) is included in this repository.

## Development

To set up your environment to develop this theme, run `script/bootstrap`.

To test your theme, run `script/server` (or `bundle exec jekyll serve`) and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme and the contents. As you make modifications, your site will regenerate and you should see the changes in the browser after a refresh.

## License

The theme is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
