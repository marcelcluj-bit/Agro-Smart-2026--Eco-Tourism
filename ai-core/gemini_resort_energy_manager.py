# Gemini AI Core - Resort HVAC & Automated Energy Savings Manager

class GeminiAgroSmartManager:
    def __init__(self, main_rooms=14, cabins=6):
        self.total_units = main_rooms + cabins
        self.occupied_units = 0

    def optimize_room_climate(self, room_id, is_occupied, current_temp_c):
        """
        Automated climate adjustment: shuts down HVAC when guests check out to optimize OPEX.
        """
        if not is_occupied:
            print(f"[Gemini AI] Unit {room_id}: Unoccupied. Setting HVAC to Eco-Standby (18°C). Saving energy.")
            return "ECO_STANDBY"
        else:
            print(f"[Gemini AI] Unit {room_id}: Occupied. Maintaining requested temperature ({current_temp_c}°C).")
            return "COMFORT_MODE"

if __name__ == "__main__":
    manager = GeminiAgroSmartManager()
    print("--- Simulating Smart Guest Checkout HVAC Adjustment ---")
    manager.optimize_room_climate(room_id="Cabin-03", is_occupied=False, current_temp_c=22.0)
