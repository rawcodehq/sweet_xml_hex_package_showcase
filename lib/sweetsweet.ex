defmodule Sweetsweet do
  @simple """
  <notes>
    <note>
    <id>1</id>
      <to>Tove</to>
      <from>Jani</from>
      <heading>Reminder</heading>
      <body>Don't forget me this weekend!</body>
    </note>
    <note>
      <id>2</id>
      <to>Jove</to>
      <from>Tani</from>
      <heading>Xeminder</heading>
      <categories>
        <category id="3">Inbox</category>
        <category id="5">Important</category>
      </categories>
    </note>
  </notes>
  """
  import SweetXml
  def simple_parse do
    parse(@simple)
    |> xmap(notes: [
      ~x[//notes/note]l,
      id: ~x[./id/text()]i,
      to: ~x[./to/text()]s,
      from: ~x[./from/text()]s,
      heading: ~x[./heading/text()]s,
      body: ~x[./body/text()]s,
      categories: [
        ~x[./categories/category]l,
        id: ~x[./@id]i,
        name: ~x[./text()]
      ]
    ])
    |> IO.inspect
  end
end
