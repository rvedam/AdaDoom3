--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
package body Neo.System.Processor
  is
  ----------
  -- Test --
  ----------
    procedure Test
      is
      -----------
      procedure D
      -----------
        is
        begin
          Put_Call_Stack;
        end D;
      -----------
      procedure C
      -----------
        is
        begin
          D;
        end C;
      -----------
      procedure B
      -----------
        is
        begin
          C;
        end B;
      -----------
      procedure A
      -----------
        is
        begin
          B;
        end A;
      begin
        Put_Title("PROCESSOR TEST");
        Put;
        Put_State;
        Put_Line(TAB & "Clock ticks: " & Integer_8_Unsigned'Image(Processor.Get_Clock_Ticks));
        Hang_Window;
        Put_Line(TAB & "Clock ticks: " & Integer_8_Unsigned'Image(Processor.Get_Clock_Ticks));
        Hang_Window;
        Put_Line(TAB & "Clock ticks: " & Integer_8_Unsigned'Image(Processor.Get_Clock_Ticks));
        A;
        Hang_Window;
    end Test;
  ----------------
  -- Initialize --
  ----------------
    function Initialize(
      return Record_Processor
      is
      begin
        return Instantiated_Implementation.Initialize;
      end Initialize;
  ---------
  -- Put --
  ---------
    procedure Put
      is
      begin
        Put_Line(TAB & "Number of processors:" & Integer_8_Positive'Wide_Image(Processor.Number_Of_Processors));
        Put_Line(TAB & "Speed in megahertz:"   & Integer_8_Natural'Wide_Image(Processor.Speed_In_Megahertz));
        case Processor.Vendor is
          when Apple_IBM_Motorola_Vendor =>
            Put_Line(TAB & "A PowerPC processor was detected for some reason, are you using a debugger?");
          when Unsupported_Vendor =>
            Put_Line(TAB & "Unsupported CPU, but apperently x86-64");
          when Advanced_Micro_Devices_Vendor =>
            Put_Line(TAB & "Advanced Micro Devices");
          when Intel_Vendor =>
            Put_Line(TAB & "Intel");
        end case;
        case Processor.Rounding is
          when Truncate_Rounding =>
            Put_Line(TAB & "Set to truncate");
          when Up_Rounding =>
            Put_Line(TAB & "Set to round up");
          when Down_Rounding =>
            Put_Line(TAB & "Set to round down");
          when Nearest_Rounding =>
            Put_Line(TAB & "Set to round to nearest");
        end case;
        case Processor.Precision is
          when Single_Precision =>
            Put_Line(TAB & "Set for single precision");
          when Double_Precision =>
            Put_Line(TAB & "Set for double precision");
          when Double_Extended_Precision =>
            Put_Line(TAB & "Set for double extended precision");
        end case;
        if Processor.Has_3DNow then
          Put_Line(TAB & "Has 3DNow!");
        end if;
        if Processor.Has_3DNow_Supplement then
          Put_Line(TAB & "Has 3DNow!+");
        end if;
        if Processor.Has_Multi_Media_Extensions then
          Put_Line(TAB & "Has MMX");
        end if;
        if Processor.Has_Multi_Media_Extensions_Supplement then
          Put_Line(TAB & "Has MMX+");
        end if;
        if Processor.Has_Fused_Multiply_Add_3 then
          Put_Line(TAB & "Has FMA3");
        end if;
        if Processor.Has_Fused_Multiply_Add_4 then
          Put_Line(TAB & "Has FMA4");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_1 then
          Put_Line(TAB & "Has SSE");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_2 then
          Put_Line(TAB & "Has SSE2");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_3 then
          Put_Line(TAB & "Has SSE3");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_3_Supplement then
          Put_Line(TAB & "Has SSSE3");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_4_Supplement then
          Put_Line(TAB & "Has SSE4a");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_4_1 then
          Put_Line(TAB & "Has SSE4.1");
        end if;
        if Processor.Has_Streaming_SIMD_Extensions_4_2 then
          Put_Line(TAB & "Has SSE4.2");
        end if;
        if Processor.Has_Bit_Manipulation_Extensions_1 then
          Put_Line(TAB & "Has BMI1");
        end if;
        if Processor.Has_Bit_Manipulation_Extensions_2 then
          Put_Line(TAB & "Has BMI2");
        end if;
        if Processor.Has_Advanced_Vector_Extensions_1 then
          Put_Line(TAB & "Has AVX");
          if not Processor.Has_Advanced_Vector_Extensions_Enabled then
            Put_Line(", but it's disabled");
          else
            New_Line;
          end if;
        end if;
        if Processor.Has_Advanced_Vector_Extensions_2 then
          Put(TAB & "Has AVX2");
          if not Processor.Has_Advanced_Vector_Extensions_Enabled then
            if not Processor.Has_Advanced_Vector_Extensions_1 then
              Put_Line(", but it's disabled");
            else
              Put_Line(", but it's also disabled");
            end if;
          else
            New_Line;
          end if;
        end if;
        if Processor.Has_Context_ID_Manager then
          Put_Line(TAB & "Has INVPCID");
        end if;
        if Processor.Has_Population_Count then
          Put_Line(TAB & "Has POPCNT");
        end if;
        if Processor.Has_Leading_Zero_Count then
          Put_Line(TAB & "Has LZCNT");
        end if;
        if Processor.Has_Carryless_Multiplication_Of_Two_64_Bit then
          Put_Line(TAB & "Has PCLMULQDQ");
        end if;
        if Processor.Has_Processor_Extended_States_Enabled then
          Put_Line(TAB & "Has OSXSAVE");
        end if;
        if Processor.Has_Half_Precision_Floating_Point_Convert then
          Put_Line(TAB & "Has F16C");
        end if;
        if Processor.Has_High_Precision_Convert then
          Put_Line(TAB & "Has CVT16");
        end if;
        if Processor.Has_Advanced_Encryption_Service then
          Put_Line(TAB & "Has AES");
        end if;
        if Processor.Has_Advanced_State_Operations then
          Put_Line(TAB & "Has FXSR");
        end if;
        if Processor.Has_Extended_Operation_Support then
          Put_Line(TAB & "Has XOP");
        end if;
        if Processor.Has_Hyperthreading then
          Put_Line(TAB & "Has HTT");
        end if;
        if Processor.Has_Conditional_Move then
          Put_Line(TAB & "Has CMOV");
        end if;
        if Processor.Has_Denormals_Are_Zero then
          Put_Line(TAB & "Has DAZ");
        end if;
        if Processor.Has_Flush_To_Zero then
          Put_Line(TAB & "Has FTZ");
        end if;
      end Put;
  ---------
  -- Set --
  ---------
    procedure Set(
      Rounding  : in Enumerated_Rounding;
      Precision : in Enumerated_Precision)
      is
      begin
        Protected_Data.Set(
          Instantiated_Implementation.Set_Precision(
            Precision => Precision,
            Processor => Protected_Data.Get,
              Instantiated_Implementation.Set_Rounding(
                Processor => Protected_Data.Get,
                Rounding  => Rounding)));
      end Set;
  ------------------
  -- Set_Rounding --
  ------------------
    procedure Set_Rounding(
      Rounding : in Enumerated_Rounding)
      is
      begin
        Protected_Data.Set(Instantiated_Implementation.Set_Rounding(Protected_Data.Get, Rounding));
      end Set_Rounding;
  -------------------
  -- Set_Precision --
  -------------------
    procedure Set_Precision(
      Precision : in Enumerated_Precision)
      is
      begin
        Protected_Data.Set(Instantiated_Implementation.Set_Precision(Protected_Data.Get, Precision));
      end Set_Precision;
  --------------------
  -- Get_Clock_Tics --
  --------------------
    function Get_Clock_Ticks
      return Integer_8_Unsigned
      renames Instantiated_Implementation.Get_Clock_Ticks;
  ---------
  -- Get --
  ---------
    function Get
      return Record_Processor
      is
      begin
        return Protected_Data.Get;
      end Get;
  ---------
  -- Put --
  ---------
    procedure Put
      is
      begin
        Instantiated_Implementation.Put(Protected_Data.Get);
      end Put_State;
  ----------------------
  -- Check_Exceptions --
  ----------------------
    procedure Check_Exceptions
      is
      begin
        Instantiated_Implementation.Check_Exceptions(Protected_Data.Get);
      end Check_Exceptions;
  -----------------
  -- Clear_Stack --
  -----------------
    procedure Clear_Stack
      is
      begin
        Instantiated_Implementation.Clear_Stack;
      end Clear_Stack;
  --------------------
  -- Is_Stack_Empty --
  --------------------
    function Is_Stack_Empty
      return Boolean
      is 
      begin
        return Instantiated_Implementation.Is_Stack_Empty;
      end Is_Stack_Empty;
  end Neo.System.Processor;