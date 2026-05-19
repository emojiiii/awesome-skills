const root = $.GetContextPanel();
const title = root.FindChildTraverse("CustomHudTitle") as LabelPanel | null;

GameEvents.Subscribe("custom_hud_update", (event: { title?: string }) => {
  if (title && event.title) {
    title.text = event.title;
  }
});
