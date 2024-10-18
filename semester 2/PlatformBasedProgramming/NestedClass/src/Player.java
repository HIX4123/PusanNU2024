public abstract class Player {


    private String name;
    private int jerseyNumber;
    protected int speed;


    // Builder 클래스를 정의하시오. (단, static nested class 로 정의하시오.  )
    public static class Builder {


        private String name;
        private int jerseyNumber;
        protected int speed;
        protected Class<? extends Player> playerType;

        public Builder setPlayerType(String playerType) {
            this.playerType = switch (playerType.toLowerCase()) {
                case "forward" -> Forward.class;
                case "midfielder" -> MidFielder.class;
                case "defender" -> Defender.class;
                default -> throw new IllegalStateException("Unexpected value: " + playerType.toLowerCase());
            };
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setJerseyNumber(int jerseyNumber) {
            this.jerseyNumber = jerseyNumber;
            return this;
        }

        public Builder setSpeed(int speed) {
            this.speed = speed;
            return this;
        }

        public Player build() {
            try {
                Player player = playerType.getDeclaredConstructor().newInstance();
                player.name = this.name;
                player.jerseyNumber = this.jerseyNumber;
                player.speed = this.speed;
                return player;
            } catch (Exception e) {
                throw new RuntimeException("Failed to build new Player Class", e);
            }
        }


    }


    protected int getSpeed() {
        return this.speed;
    }

    @Override
    public String toString() {
        return String.format("Player Name='%s, JerseyNumber=%d, SPEED=%d", name, jerseyNumber, speed);
    }


}