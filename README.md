# Access Todoist from Pascal with the Todoist REST API

Cross-platform test of accessing [Todoist](https://todoist.com/) from Pascal.

Uses `TCastleDownload` component underneath from [Castle Game Engine](https://castle-engine.io/). See [TCastleDownload API docs](https://castle-engine.io/apidoc/html/CastleDownload.TCastleDownload.html).

Uses [Todoist REST API](https://developer.todoist.com/rest/v2/).

Build like any other CGE project -- use [Castle Game Engine editor](https://castle-engine.io/editor) or [Castle Game Engine build tool](https://castle-engine.io/build_tool), that underneath call [FPC](https://www.freepascal.org/) or [Delphi](https://www.embarcadero.com/products/Delphi).

To make it compile and work you need to provide some Todoist info:

- Create a file with your Todoist API token called `token.inc`. It should contain a single Pascal string with your token like

    ```
    '00aabbccddeeff00112233445566778899aabbcc'
    ```

- In code, provide some valid task ID. Get task id by looking at Todoist UI in browser, like https://todoist.com/app/today/task/XXXXXXX .

This gets your projects names, and gets a description (in Markdown) of a single specific task.

Enjoy!

Michalis Kamburelis

## License

Permissive BSD 3, https://github.com/castle-engine/castle-engine/blob/master/doc/licenses/COPYING.BSD-3-clause.txt .

