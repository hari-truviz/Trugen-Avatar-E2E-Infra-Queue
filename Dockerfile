FROM golang:1.25.1-alpine3.21

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

EXPOSE 8080

# Run
CMD ["/main"]
