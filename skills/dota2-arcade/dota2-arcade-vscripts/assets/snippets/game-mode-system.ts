export class ExampleGameSystem {
  private round = 0;

  public startNextRound(): void {
    this.round += 1;
    print(`Starting round ${this.round}`);
  }
}
