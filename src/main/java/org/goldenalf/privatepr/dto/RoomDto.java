package org.goldenalf.privatepr.dto;


import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RoomDto {
    private Long id;

    @NotNull(message = "Укажите номер комнаты")
    @Min(value = 0, message = "номер комнаты должен быть положительным целым числом")
    private Integer roomNumber;

    @NotNull(message = "Укажите размер комнаты")
    @Min(value = 0, message = "размер комнаты должен быть больше 0")
    private Double roomSize;

    private boolean isAvailable;
}
