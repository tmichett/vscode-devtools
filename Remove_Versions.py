def process_file(input_file, output_file):
    try:
        # Open the input file for reading
        with open(input_file, 'r') as infile:
            # Read all lines from the input file
            lines = infile.readlines()

        # Process each line
        processed_lines = [line.split("==")[0].strip() + '\n' for line in lines]

        # Write the processed lines to the output file
        with open(output_file, 'w') as outfile:
            outfile.writelines(processed_lines)

        print(f"File processed successfully. Updated content saved to {output_file}.")
    except FileNotFoundError:
        print(f"Error: The file {input_file} does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
input_file = "requirements.txt"  # Replace with your input file name
output_file = "requirements_noversion.txt"  # Replace with your desired output file name

process_file(input_file, output_file)
