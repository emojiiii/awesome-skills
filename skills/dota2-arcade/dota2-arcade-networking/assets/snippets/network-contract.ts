export interface CustomNetTableDeclarations {
  game_state: {
    round: {
      round: number;
      timeRemaining: number;
    };
  };
}

export interface CustomGameEventDeclarations {
  request_start_round: {
    round: number;
  };
  custom_hud_update: {
    title: string;
  };
}
